import 'package:flutter/material.dart';
import 'package:test_task/constant.dart';

class SnackBarWidget {
  void showSnackBarDelete(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: secondaryColor,
      duration: const Duration(seconds: 5),
      content: const Text(
        'Cancel deletion',
        style: TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        textColor: primaryColor,
        label: 'Cancel',
        onPressed: () {},
      ),
    ));
  }

  void showSnackBarAdd(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: secondaryColor,
      duration: Duration(seconds: 3),
      content: Text(
        'Note successfully created',
        style: TextStyle(color: Colors.white),
      ),
    ));
  }

  void showSnackBarUpdate(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: secondaryColor,
      duration: Duration(seconds: 3),
      content: Text(
        'Note successfully updated',
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
