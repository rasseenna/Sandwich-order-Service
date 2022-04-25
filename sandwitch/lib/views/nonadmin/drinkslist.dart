import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin_controller.dart';
import '../../utils/colors.dart';
import '../../utils/textStyles.dart';
import '../admin/productlistitems.dart';
import 'drinklistItem.dart';
import 'nonadmin_product_list.dart';

class DrinkList extends StatefulWidget {
  const DrinkList({Key? key}) : super(key: key);

  @override
  State<DrinkList> createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  final adminController = Get.put(AdminController());

    @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      adminController.getDrinkList();
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
          'Drink List',
          style: subTextStyle1,
        ),
      ),
      body: productList(),

    ));
  }

  Widget productList() {
    return Obx(
      () {
        return adminController.drinkLoading.value?CircularProgressIndicator(): ListView.builder(
            itemCount: adminController.drinkList.value.length,
            shrinkWrap: true,
           // physics: const NeverScrollableScrollPhysics(),
    
            itemBuilder: (context, index) {
              return NonAdminDrinkListItem(adminController.drinkList[index]);
            });
      }
    );
  }
}
