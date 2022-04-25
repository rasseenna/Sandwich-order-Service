import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../constants/api_constants.dart';
import '../services/api_services.dart';
import '../views/admin/adminhome_main.dart';
import '../views/login/login_screen.dart';
import '../views/nonadmin/home.dart';
import '../widgets/snackbars.dart';
import '../widgets/validations.dart';

class LoginController extends GetxController {
  String userNameValue = '';
  String passwordValue = '';

  APIservices apiProvider = APIservices();
  signInWithEmailId(
      String username, String password, BuildContext context) async {
    //  print("mail is id $emailId");
    //  print("pass is $password");
    userNameValue = username;
    passwordValue = password;
    var error = Validation.validateFullName(username, "Enter Username");
    var passwordError = Validation.validateLoginPassword(password);
    //  print("countrycode is ${passwordError}");
    if (error != null) {
      //    print("error not null");
      Get.snackbar("Error", error,
          backgroundColor: Colors.red,
          borderRadius: 0,
          barBlur: .5,
          margin: EdgeInsets.all(0),
          colorText: Colors.white,
          snackStyle: SnackStyle.GROUNDED);
    } else if (passwordError != null) {
      print("not null");
      Get.snackbar("Error", passwordError,
          backgroundColor: Colors.red,
          borderRadius: 0,
          barBlur: .5,
          margin: EdgeInsets.all(0),
          colorText: Colors.white,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      try {
        var data = {
          "username": userNameValue.trim(),
          "password": passwordValue.trim(),
        };
        final jsonObject = data;
        print(jsonObject);
        final response = apiProvider.apiClient(loginUrl, jsonObject);
        response.then((value) {
          Loader.hide();
          if (value['status'] == "fail") {
            //  print("ubsssssssssss");
            showErrorSnackBar('Failed', 'Invalid Username/Password');
          } else
            // storage.write("username", value['username']);
            // storage.write("isLoggedIn", true);
            if (value['username'] == "admin") {
              Get.offAll(AddProductMainPageView());
            } else {
              Get.offAll(HomeView());
            }
          debugPrint("login response:- $value");
          //ApiResponseFetching(value);
        }, onError: (error) {
          showErrorSnackBar('Error', error.toString());
        });
      } catch (e) {
        print(e);
      }
    }
  }

//    Future getsandwitch() async {

//   final response = await apiProvider.apiClient(viewAdminUrl, param);
//   return response;
// }
// void getSnadwitchList(

//     ) async {

//   sandwitchLoading.value=true;

//   var response = getsandwitch();
//   response.then((value) {

//     if(value['status']==true){
//       sandwitchLoading.value=true;
//      var pro= ProductListModel.fromJson(value);
//      productList.value=pro.result!;
//     }else{
//       sandwitchLoading.value=false;

//     }

//   }, onError: (e) {

//   });

// }
}
