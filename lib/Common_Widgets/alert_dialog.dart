import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog {
  static void alertBox(String title, String subTitle, Function() onConfirm) {
    Get.defaultDialog(
        title: title,
        middleTextStyle: const TextStyle(color: Colors.black),
        titleStyle: const TextStyle(color: Colors.black),
        middleText: subTitle,
        textConfirm: 'Ok',
        confirmTextColor: Colors.black,
        barrierDismissible: false,
        onConfirm: onConfirm);
  }
}
