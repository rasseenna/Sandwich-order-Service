import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandwitch/widgets/gradient_button.dart';

import '../../controller/non_admin_controller.dart';
import '../../utils/colors.dart';
import '../../utils/textStyles.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final nonadminController = Get.put(NonAdminController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          centerTitle: false,
          title: Text(
            'Receipt : ${nonadminController.receiptNumber.value}',
            style: subTextStyles,
          ),
          leading: GestureDetector(
              child: const Icon(Icons.arrow_back, color: Colors.white),
              onTap: () {
                Get.back();
              }),
        ),
        body: ListView(
          children: [
            productList(),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: createPriceItem(
                    "Total Amount",
                    nonadminController.order.totalPrice.toString(),
                    Colors.grey.shade700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  productList() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: nonadminController.orderlist.value.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, left: 8, top: 9),
                            child: Image.asset('assets/images/maindoor.png'),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    nonadminController.orderlist[index].name
                                        .toString(),
                                    maxLines: 2,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: Text(
                                    nonadminController.orderlist[index].price
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.amberAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            flex: 100,
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          Text(
            "\u20B9 $value",
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
