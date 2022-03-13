import 'package:flutter/material.dart';
import 'package:test_task/constant.dart';

class CheckBoxWidget extends StatefulWidget {
  static bool isChecked = false;
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBox();
}

class _CheckBox extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: primaryColor,
        value: CheckBoxWidget.isChecked,
        onChanged: (value) {
          setState(() {
            CheckBoxWidget.isChecked = value!;
          });
        });
  }
}
