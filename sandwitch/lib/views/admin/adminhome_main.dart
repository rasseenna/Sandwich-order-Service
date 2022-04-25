import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandwitch/controller/admin_controller.dart';
import 'package:sandwitch/model/dropdown_model.dart';

import 'package:sandwitch/views/admin/productlistitems.dart';
import 'package:sandwitch/views/admin/productlistitems.dart';
import '../../utils/colors.dart';
import '../../utils/myservices.dart';
import '../../utils/textStyles.dart';
import '../../widgets/gradient_button.dart';
import 'add_product.dart';

class AddProductMainPageView extends StatefulWidget {
  @override
  State<AddProductMainPageView> createState() => _AddProductMainPageViewState();
}

class _AddProductMainPageViewState extends State<AddProductMainPageView> {
  final adminController = Get.put(AdminController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      adminController.getSandwitchList();
      adminController.getSnackList();
      adminController.getDrinkList();


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 19,
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          title: Text(
            'Sandwitch Ordering ',
            style: subTextStyles,
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(AddProduct());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'assets/images/add_black.svg',
                      )),
                )),
          ],
        ),
        backgroundColor: bgColor,
        body: Obx(() {
          return adminController.sandwitchLoading.value
              ?
          const SizedBox()
              :adminController.productList.value.isEmpty?
          Container(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/maindoor.png",
                      width: 40, height: 40),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Center(
                      child: Text(
                        'There are no products added yet, Add new',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: subTextStyles,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GradientButton(
                      onPressed: () {
                        Get.to(AddProduct());
                        //  state.addBranchesPage();
                      },
                      text: 'Add Product',
                    ),
                  ),
                ],
              )),
            )
              :

              //   productList()
              //       :


          productList();
        }),
      ),
    );
  }

  Widget productList() {
    // List<DropDownModel> sand=[
    //   DropDownModel(
    //       title: "aaaaaa"
    //   ),
    //   DropDownModel(
    //     title: "aaaaaaaaaa"
    //   ),
    //   DropDownModel(
    //       title: "aaaaaaaaaa"
    //   ),
    //   DropDownModel(
    //       title: "aaaaaaaaaa"
    //   )
    // ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left:18.0,bottom: 15),
            child: const Text("Sandwitch",style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),),
          ),
          Column(
            children: adminController.productList.map((e) => ProductListItems(title:e.name,id:e.id,image:e.image)).toList(),
          ),

          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.only(left:18.0,bottom: 15),
            child: Text("Drinks",style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),),
          ),
          Column(
            children:adminController.drinkList.map((e) => ProductListItems(title:e.name,id:e.id,image:e.image)).toList(),
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.only(left:18.0,bottom: 15),
            child: Text("Snacks",style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),),
          ),
          Column(
            children: adminController.snackList.map((e) => ProductListItems(title:e.name,id:e.id,image:e.image)).toList(),
          )
        ],
        // child: ListView.builder(
        //   itemCount: 12,
        //    // itemCount: 19,
        //     itemBuilder: (context, index) {
        //       return const ProductListItems();
        //     }),
      ),
    );
  }

  AddProducts() {}
}
