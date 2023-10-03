import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  // unfocus current and focus next
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessageCenter(String message) {
    return Fluttertoast.showToast(msg: message, gravity: ToastGravity.CENTER);
  }

  static toastMessage(String message) {
    return Fluttertoast.showToast(msg: message, gravity: ToastGravity.BOTTOM);
  }

  static showDialog(Widget child) {
    return Get.dialog(child);
  }

  static showSnakBar(String title, String message) {
    return Get.snackbar(title, message);
  }

  static formatDate(DateTime dateTime) {
    return DateFormat('dd-MMM-yyyy').format(dateTime);
  }

  static formatTime(DateTime dateTime) {
    return DateFormat('HH:mm: a').format(dateTime);
  }

  static setFontStyle(
      {double fontSize = 12,
      fontWeight = FontWeight.normal,
      Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
