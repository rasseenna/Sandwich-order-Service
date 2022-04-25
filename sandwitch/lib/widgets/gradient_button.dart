

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/colors.dart';
import '../utils/textStyles.dart';


class GradientButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPressed;

  const GradientButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:16.0,right: 16,top: 12,bottom: 12),
          child: Center(child: Text(text,style: const TextStyle(
            color: Colors.white
          ),)),
        )),
    );

  }
}
