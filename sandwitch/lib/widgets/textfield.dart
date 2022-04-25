import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/textStyles.dart';

class TextFormFields extends StatelessWidget {
final TextEditingController? controller;
final String? hint;
final Function? validator;
final Widget? prefixIcon;
final Function? onChange;
final int? maxline;
final List<TextInputFormatter>? inputFormater;
TextFormFields({this.controller,this.hint,this.validator,this.prefixIcon,this.onChange,this.maxline,this.inputFormater});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters:inputFormater,
maxLines:maxline ,
style: TextStyle(
  color: Colors.white
),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,

        hintStyle: textFieldTexts,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      validator: (value){
        return validator!(value);
      },
      onChanged: (value){
        return onChange!(value);
      },

    );
  }
}
