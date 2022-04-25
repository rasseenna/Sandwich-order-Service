import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandwitch/views/nonadmin/snacklisteItem.dart';

import '../../controller/admin_controller.dart';
import '../../utils/colors.dart';
import '../../utils/textStyles.dart';
import '../admin/productlistitems.dart';
import 'nonadmin_product_list.dart';

class SnackList extends StatefulWidget {
  const SnackList({Key? key}) : super(key: key);

  @override
  State<SnackList> createState() => _SnackListState();
}

class _SnackListState extends State<SnackList> {
  final adminController = Get.put(AdminController());

    @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      adminController.getSnackList();
   //   adminController.getSnackList();
    //  adminController.getDrinkList();


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {

            Get.back();
          },
        ),
        title: Text(
          'Snack List',
          style: subTextStyle1,
        ),
      ),
      body: productList(),

    ));
  }

  Widget productList() {
    return Obx(
      () {
        return adminController.snackLoading.value?CircularProgressIndicator(): ListView.builder(
            itemCount: adminController.snackList.value.length,
            shrinkWrap: true,
           // physics: const NeverScrollableScrollPhysics(),
    
            itemBuilder: (context, index) {
              return NonAdminSnackListItem(adminController.snackList[index]);
            });
      }
    );
  }
}
