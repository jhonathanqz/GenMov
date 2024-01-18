import 'package:flutter/material.dart';

class SnackHelper {
  static void showSnackInformation(
    String message,
    Color color,
    BuildContext context, {
    int seconds = 3,
  }) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: seconds,
        ),
      ),
    );
  }

  static void removeSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}
