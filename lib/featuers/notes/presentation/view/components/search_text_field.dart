import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSize searchTextField({
  void Function(String)? onChanged,
  TextEditingController? controller,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'search'.tr,
            prefixIcon: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back),
            ),
            suffixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    ),
  );
}
