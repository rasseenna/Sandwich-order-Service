import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sandwitch/views/nonadmin/home.dart';

import 'views/admin/adminhome_main.dart';
import 'views/login/login_screen.dart';
import 'views/nonadmin/delivery_address.dart';
import 'views/nonadmin/order_history.dart';
import 'views/nonadmin/order_summary.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: ''
          '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      themeMode: ThemeMode.system,
home: LoginView(),
     // home: LoginView(),

    );

  }
}


