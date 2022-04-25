import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sandwitch/widgets/gradient_button.dart';
import 'package:sandwitch/widgets/textfield.dart';

import '../../controller/admin_controller.dart';
import '../../utils/colors.dart';
import '../../utils/myservices.dart';

import '../../utils/textStyles.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/validations.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'adminhome_main.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final branchNameController = TextEditingController();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final productCategoryController = TextEditingController();
  final priceController = TextEditingController();
  final adminController = Get.put(AdminController());

  final formkey = GlobalKey<FormState>();
  RangeValues currentRangeValues = const RangeValues(50, 500);

  // get categoryValue => null;

  //get admincontroller => null;

  Future<bool> onWillPop() {
    Get.off(AddProductMainPageView());
    return Future.value(true);
  }

  double start = 50;
  double end = 500;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(AddProductMainPageView());
                //Get.back();
              },
            ),
            title: Text(
              'Add Product',
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
                    Text('Choose food category', style: labelText4),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: NewDropdownTextField(
                        items: adminController.foodCategory,
                        label: "Category",
                        onSelected: (String? newValue) {
                          adminController.categoryName.value = newValue.toString();
                        },
                        // onSelected: (String value) {
                        // productCategoryController.value =
                        //     value as TextEditingValue;
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('Product Name', style: labelText4),
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
                          hint: 'Enter item name',
                          validator: Validation.validateItem,
                          controller: nameController,
                          onChange: (value) {
                            adminController.productName.value = value;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('Description', style: labelText4),
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
                          controller: descriptionController,
                          onChange: (value) {
                            adminController.description.value = value;
                          },
                          maxline: 6,
                          inputFormater: [
                            LengthLimitingTextInputFormatter(100)
                          ],
                          //    inputFormatters: [
                          //     LengthLimitingTextInputFormatter(10),
                          // ],
                          hint: 'Enter short description',
                          validator: Validation.validateItem,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('Price Range', style: labelText4),
                    const SizedBox(
                      height: 8,
                    ),
                    RangeSlider(
                      min: 50,
                      max: 500,
                      values: RangeValues(start, end),
                      labels: RangeLabels(start.toString(), end.toString()),
                      activeColor: Colors.red,
                      divisions: 10,
                      onChanged: (value) {
                        setState(() {
                          start = value.start;
                          end = value.end;
                        });
                      },
                      //   onChanged: (RangeValues values) {
                      //    setState(() {
                      //       currentRangeValues = values;
                      //     });
                      //   },
                      // labels: RangeLabels(
                      //   currentRangeValues.start.round().toString(),
                      //   currentRangeValues.end.round().toString(),
                      // ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GradientButton(
                        onPressed: () {
                          adminController.addProducts(
                              productName: nameController.text.toString(),
                              description:
                                  descriptionController.text.toString(),
                              priceRange: end.toStringAsFixed(2),
                              context: context);
                          //Api call
                        },
                        text: 'Submit'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
