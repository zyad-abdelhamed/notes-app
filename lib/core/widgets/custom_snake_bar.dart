import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorSnackBar({
  required String message,
  SnackPosition position = SnackPosition.BOTTOM,
}) {
  Get.snackbar(
    '',
    '',
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      textAlign: TextAlign.left,
    ),
    backgroundColor: Colors.red,
    snackPosition: position,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    borderRadius: 12,
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}
