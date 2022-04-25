import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandwitch/controller/admin_controller.dart';

import '../../controller/non_admin_controller.dart';
import '../../utils/colors.dart';
import '../../utils/myservices.dart';
import '../../utils/textStyles.dart';
import '../../widgets/gradient_button.dart';
import '../admin/productlistitems.dart';
import 'sandwitch_list.dart';


class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final nonAdminController = Get.put(NonAdminController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {});

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
          // actions: [
          //   GestureDetector(
          //       onTap: () {
          //        // Get.to(AddProduct());
          //       },
          //       child: Padding(
          //         padding: const EdgeInsets.only(right: 17),
          //         child: SizedBox(
          //             height: 24,
          //             width: 24,
          //             child: SvgPicture.asset(
          //               'assets/images/add_black.svg',
          //             )),
          //       )),
          // ],
        ),
        backgroundColor: bgColor,
        body:


          //   productList()
          //       :

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
                          'No Order Placed',
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
                          Get.to(SandwitchList());
                          //  state.addBranchesPage();
                        },
                        text: 'Place Order',
                      ),
                    ),
                  ],
                )),
          )

      ),
    );
  }


}
