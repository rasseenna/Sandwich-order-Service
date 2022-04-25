import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/non_admin_controller.dart';
import '../../utils/colors.dart';
import '../../utils/textStyles.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/textfield.dart';
import '../../widgets/validations.dart';

class DeliveryAddress extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final nonadminController=Get.put(NonAdminController());
  final nameController=TextEditingController();
  final addressController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Get.to(AddProductMainPageView());
            //Get.back();
          },
        ),
        title: Text(
          'Delivery Address',
          style: subTextStyle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(
                  height: 10,
                ),

                Text('Name', style: labelText4),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11),
                      topLeft: Radius.circular(11),
                      bottomLeft: Radius.circular(11),
                      bottomRight: Radius.circular(11),
                    ),
                    color: uidTFieldColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: TextFormFields(
                      controller: nameController,
                      hint: 'Enter your  name',
                      validator: Validation.validateFullName,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text('Delivery Address', style: labelText4),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11),
                      topLeft: Radius.circular(11),
                      bottomLeft: Radius.circular(11),
                      bottomRight: Radius.circular(11),
                    ),
                    color: uidTFieldColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: TextFormFields(
                      controller: addressController,
                      onChange: (v) {},
                      maxline: 6,



                      hint: 'Enter address ',
                      validator: Validation.validateAddress,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                GradientButton(onPressed: () {
                  nonadminController.submitAddress(
                    name:nameController.text.toString(),
                    deliveryAddress: addressController.text.toString()
                  );
                }, text: 'Submit'),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}