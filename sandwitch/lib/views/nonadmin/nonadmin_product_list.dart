import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandwitch/model/productlistmodel.dart';
import 'package:sandwitch/views/nonadmin/drinkslist.dart';

import '../../controller/non_admin_controller.dart';

class NonAdminProductListItem extends StatelessWidget {
  NonAdminProductListItem(this.productList);
  final Result productList;
  final nonAdminController = Get.put(NonAdminController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              nonAdminController.sandwichId.value = productList.id.toString();
              Get.to(DrinkList());
            },
            child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/maindoor.png')))),
          ),
          Expanded(
              child: Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    productList.name.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "rs ${productList.price.toString()}",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
