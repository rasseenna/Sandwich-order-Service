import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName,{arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName,arguments: arguments);
  }

  Future<dynamic> navigateReplaceTo(String routeName,{arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName,arguments: arguments);
  }

  Future<dynamic> navigateReplaceToUntil(String routeName,{arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName,(Route<dynamic> route) => false);
  }

  void goBack(){
    return navigatorKey.currentState?.pop();
  }
}
