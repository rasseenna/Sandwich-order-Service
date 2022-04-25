import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandwitch/controller/admin_controller.dart';

class ProductListItems extends StatelessWidget {
  ProductListItems({this.title, this.image, this.id});
  String? title;
  String? image;
  String? id;
  //const  ProductListItems(String? title, String? id, {Key? key}) : super(key: key);
final adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      child: Row(
        children: [
          Container(
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
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: IconButton(
                            onPressed: () {
                              adminController.deleteProduct(id: id);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      )),
                  Text(
                    title.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 17),
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
