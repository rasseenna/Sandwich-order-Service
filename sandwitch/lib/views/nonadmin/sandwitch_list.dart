import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin_controller.dart';
import '../../utils/colors.dart';
import '../../utils/textStyles.dart';
import '../admin/productlistitems.dart';
import 'nonadmin_product_list.dart';

class SandwitchList extends StatefulWidget {
  const SandwitchList({Key? key}) : super(key: key);

  @override
  State<SandwitchList> createState() => _SandwitchListState();
}

class _SandwitchListState extends State<SandwitchList> {
  final adminController = Get.put(AdminController());

    @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      adminController.getSandwitchList();
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
          'Sandwitch List',
          style: subTextStyle1,
        ),
      ),
      body: productList(),

    ));
  }

  Widget productList() {
    return Obx(
      () {
        return adminController.sandwitchLoading.value?CircularProgressIndicator(): ListView.builder(
            itemCount: adminController.productList.value.length,
            shrinkWrap: true,
           // physics: const NeverScrollableScrollPhysics(),
    
            itemBuilder: (context, index) {
              return NonAdminProductListItem(adminController.productList[index]);
            });
      }
    );
  }
}
