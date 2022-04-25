import 'dart:convert';
import 'dart:io';
import 'dart:js';

import 'package:flutter/services.dart';
import 'package:flutter/src/material/slider_theme.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sandwitch/model/dropdown_model.dart';
import 'package:sandwitch/views/admin/add_product.dart';

import '../constants/api_constants.dart';
import '../model/productlistmodel.dart';
import '../services/api_services.dart';
import '../views/admin/adminhome_main.dart';
import '../widgets/snackbars.dart';

class AdminController extends GetxController {
  RxList<Result> productList = <Result>[].obs;
  RxList<Result> snackList = <Result>[].obs;
  RxList<Result> drinkList = <Result>[].obs;
  RxBool sandwitchLoading = false.obs;
  RxBool snackLoading = false.obs;
  RxBool drinkLoading = false.obs;
  RxBool isLoading = false.obs;
  RxBool deleteLoading=false.obs;

  File? images;
  List<DropDownModel> foodCategory = [
    DropDownModel(title: 'sandwitch'),
    DropDownModel(title: 'drinks'),
    DropDownModel(title: 'snack'),
  ];

  var selectedImagePath = ''.obs;
  RxString fileName = "".obs;
  var selectedVideoPath = ''.obs;
  RxString videoFileName = "".obs;
  RxString base64Image = "".obs;
  RxString categoryName="".obs;

  Future pickImage(ImageSource imgSource) async {
    try {
      isLoading(true);
      final pickedFile = await ImagePicker().pickImage(source: imgSource);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        images = File(pickedFile.path);

        final bytes = File(images!.path).readAsBytesSync();
        base64Image.value = base64Encode(bytes);

        isLoading(false);
      } else {
        isLoading(false);
      }
    } on PlatformException catch (e) {
      print("filed to $e");
    }
  }

  APIservices apiProvider = APIservices();
  RxString productName = "".obs;
  RxString productCategory = "".obs;
  RxString description = "".obs;
  RxString priceRange = "".obs;


  void addProducts(
      {String? productName, String? productCategory,String? description,String? priceRange, required BuildContext context

      }) async {
  //  print(productName);
    if (productName == "" ||
        productCategory == "" ||
        description == "" ||
        priceRange == ""
        ) {
      showErrorSnackBar('Error', 'All Fields are mandatory');
    }
    // else if (base64Image.value == "") {
    //   showErrorSnackBar('Error', 'Choose Profile picture');
    // }
    else {
      showOverlayLoader(context);
      Future adminSubmission() async {
        var params = {
          "name": productName,
          "description": description,
          "price": priceRange,
          "category": categoryName.value,
          "image": "",
        };
        final response = await apiProvider.apiClient(addProductUrl, params);
        return response;
      }

      var response = adminSubmission();
      response.then((value) {
        Loader.hide();
        if (value["status"] == "true") {
          Get.to(AddProductMainPageView());
        } else {
          showErrorSnackBar('Error', value['message']);
        }

        // try{
        //   salaryTypeLoading.value=false;
        //   var data=SalaryTypeModel.fromJson(value);
        //   salaryType!.value=data.salaryType!;
        //   //print("data is ${data.accademyUsertype!.length}");
        // }catch(e){
        //
        // }
      }, onError: (e) {
        Loader.hide();
        showErrorSnackBar("Failed", e.toString());
      });
    }
  }

  Future getsandwitch() async {
    final response = await apiProvider.getApiClient(viewSandwichUrl);
    return response;
  }

  void getSandwitchList() async {
    sandwitchLoading.value = true;
    var response = getsandwitch();
    response.then((value) {
      if (value['status'] == "true") {
        sandwitchLoading.value = false;
        var pro = ProductListModel.fromJson(value);
        productList.value = pro.result!;
      } else {
        sandwitchLoading.value = false;
      }
    }, onError: (e) {});
  }

  Future getsnack() async {
    final response = await apiProvider.getApiClient(viewSnackUrl);
    return response;
  }

  void getSnackList() async {
    snackLoading.value = true;
    var response = getsnack();
    response.then((value) {
      if (value['status'] == "true") {
        snackLoading.value = false;
        var pro = ProductListModel.fromJson(value);
        snackList.value = pro.result!;
      } else {
        snackLoading.value = false;
      }
    }, onError: (e) {});
  }

  Future getdrink() async {
    final response = await apiProvider.getApiClient(viewDrinkUrl);
    return response;
  }

  void getDrinkList() async {
    drinkLoading.value = true;
    var response = getdrink();
    response.then((value) {
      if (value['status'] == "true") {
        drinkLoading.value = false;
        var pro = ProductListModel.fromJson(value);
        drinkList.value = pro.result!;
      } else {
        drinkLoading.value = false;
      }
    }, onError: (e) {});
  }


void deleteProduct(
      {String? id,
      }) async {
  
      Future deleteItem() async {
        var params = {
          "id": id,
       
        };
        final response = await apiProvider.apiClient(deleteProductUrl, params);
        return response;
      }
      var response = deleteItem();
      response.then((value) {
        Loader.hide();
        if (value["status"] == "true") {
        getSandwitchList();
        getSnackList();
        getDrinkList();
         // Get.to(AddProductMainPageView());
        } else {
          showErrorSnackBar('Error', value['message']);
        }

      }, onError: (e) {
       
      });
    }
  }

