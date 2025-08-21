import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackbarController showSnackBar(String message) {
  return Get.snackbar(
    'Error',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color.fromRGBO(251, 234, 229, 1),
    icon: Container(
      width: 24.w,
      height: 24.w,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.close, color: Colors.white),
    ),
  );
}
