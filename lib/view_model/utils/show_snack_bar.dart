import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String messages, {Icon? icon}) {
  Get.snackbar("System", messages,
      barBlur: 30.0,
      margin: const EdgeInsets.all(16.0),
      snackPosition: SnackPosition.TOP,
      icon: icon ??
          Icon(
            Icons.error,
            color: Colors.pinkAccent[400]!,
          ),
      duration: const Duration(seconds: 5),
      colorText: Colors.white);
}
