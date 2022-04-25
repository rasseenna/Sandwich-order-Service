import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'custom_exception.dart';




class APIservices {

/*  var headerData = {
    'Accept':'application/json',
    'Content-type': 'application/json',
  };*/

/*
  apiHeaders() {
    return headerData;
  } */

  Future apiClient(apiPath, params) async {

    var responseJson;
    try {



      final response = await http.post(Uri.parse(apiPath),
        //  headers: apiHeaders(),
          body: jsonEncode(params));
      print("res is $response");
      print("getting response");

      final String responseString = response.body.toString();
      print(responseString);
      responseJson = _returnResponse(response);
    } on SocketException {

      Get.snackbar("Error", 'No Internet connection',
          backgroundColor: Colors.red,
          borderRadius: 0,
          barBlur: .5,
          margin: EdgeInsets.all(0),
          colorText: Colors.white,
          snackStyle: SnackStyle.GROUNDED);
      throw FetchDataException('No Internet connection');
    } on FormatException {

      Get.snackbar("Error", 'Something went wrong',
          backgroundColor: Colors.red,
          borderRadius: 0,
          barBlur: .5,
          margin: EdgeInsets.all(0),
          colorText: Colors.white,
          snackStyle: SnackStyle.GROUNDED);
      print('Invalid response from server');
      throw FetchDataException("Invalid response from server");
    }
    debugPrint('api post received!');
    return responseJson;
  }

  Future getApiClient(apiPath) async {
    print("enter api calling");

    print(apiPath);
    var responseJson;
    try {


      // final uri = Uri.parse(AppConfig.searchUrl).replace(queryParameters: param);
      // print('url is.....$uri');
      final response = await http.get(Uri.parse(apiPath),
        // headers: apiHeaders()
      );

      print("getting response");
      print(response.statusCode);
      final String responseString = response.body.toString();
      print(responseString);
      responseJson = _returnResponse(response);
    } on SocketException {

      Get.snackbar("Error", 'No Internet connection',
          backgroundColor: Colors.red,
          borderRadius: 0,
          barBlur: .5,
          margin: EdgeInsets.all(0),
          colorText: Colors.white,
          snackStyle: SnackStyle.GROUNDED);
      debugPrint('No net');
      throw FetchDataException('No Internet connection');
    } on FormatException {
      Get.snackbar("Error", 'Something went wrong',
          backgroundColor: Colors.red,
          borderRadius: 0,
          barBlur: .5,
          margin: EdgeInsets.all(0),
          colorText: Colors.white,
          snackStyle: SnackStyle.GROUNDED);
      debugPrint('Invalid response from server');
      throw FetchDataException("Invalid response from server");
    }
    debugPrint('api get received!');
    return responseJson;
  }




  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 422:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        {
          throw UnauthorisedException(response.body.toString());
        }
      case 403:
        {
          throw UnauthorisedException(response.body.toString());
        }
      case 502:
        throw InternalServerException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

