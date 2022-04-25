
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';











showOverlayLoader(context){
  Loader.show(context!,
    isSafeAreaOverlay: false,
    isAppbarOverlay: true,
    isBottomBarOverlay: true,
    progressIndicator: const CircularProgressIndicator(),
    // themeData: Theme.of(context)
    //     .copyWith(accentColor: Colors.black38),
    overlayColor:Colors.black.withOpacity(0.1),
  );
}
showErrorSnackBar(title, message, {snackPosition: SnackPosition.TOP}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(title, message,
        snackPosition: snackPosition,
        backgroundColor: Colors.red,
        borderRadius: 0,
        barBlur: .5,
        isDismissible: true,
        margin: EdgeInsets.all(0),
        colorText: Colors.white,
        snackStyle: SnackStyle.GROUNDED);
  }
}

showSuccessSnackBar(title, message, {snackPosition: SnackPosition.TOP}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(title, message,
        snackPosition: snackPosition,
        backgroundColor: gradientBtnClr1,
        borderRadius: 0,
        barBlur: .5,
        isDismissible: true,
        margin: EdgeInsets.all(0),
        colorText: Colors.white,
        snackStyle: SnackStyle.GROUNDED);
  }
}


