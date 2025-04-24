import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.blueGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder,
            size: 80,
            color: Get.isDarkMode
                ? AppColors.darkModePrimaryColor
                : AppColors.lightModePrimaryColor,
          ),

          Text(
            'To do in eccomerce applecation',
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16(context: context),
          )
        ],
      ),
    );
  }
}

