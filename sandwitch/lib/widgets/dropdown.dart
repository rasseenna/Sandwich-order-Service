
import 'package:flutter/material.dart';

import '../model/dropdown_model.dart';
import '../utils/colors.dart';
import '../utils/myservices.dart';
import '../utils/textStyles.dart';


class NewDropdownTextField extends StatefulWidget {
  final List<DropDownModel> items;

  final String label;
  final Function(String) onSelected;

// final Image image;

  NewDropdownTextField(
      {required this.items, required this.label, required this.onSelected});

  @override
  _NewDropdownTextFieldState createState() => _NewDropdownTextFieldState();
}

class _NewDropdownTextFieldState extends State<NewDropdownTextField> {
  String label = '';

  @override
  void initState() {
    label = widget.label;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyService serviceObj =  MyService();
    double heightMultiplier = serviceObj.heightMultiplier;
    double widthMultiplier = serviceObj.widthMultiplier;
    return Container(
      // height: 50 * heightMultiplier,
      // width: 328 * widthMultiplier,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(11),
          topLeft: Radius.circular(11),
          bottomLeft: Radius.circular(11),
          bottomRight: Radius.circular(11),
        ),
        color: uidTFieldColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all( 8.0),
            // child: widget.image,
          ),
          Flexible(
              fit: FlexFit.tight,
              flex: 10,
              child: Text(
                label.toString(),
                style: textFieldText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
          Spacer(),
          PopupMenuButton<DropDownModel>(
            color: Color(0xff313131),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            onSelected: (DropDownModel value) {
              FocusScope.of(context).requestFocus(FocusNode());
              label = value.title.toString();
              setState(() {
                //  _controller.text = value;
                widget.onSelected(value!.title.toString());
              });
            },
            itemBuilder: (BuildContext context) {
              return widget.items.map<PopupMenuItem<DropDownModel>>((DropDownModel value) {
                return PopupMenuItem(
                    child: Text(value.title.toString(), style: dropDownText), value: value);
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
