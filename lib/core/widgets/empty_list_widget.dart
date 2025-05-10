import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';

class EmpetyListWidget extends StatelessWidget {
  const EmpetyListWidget(
      {super.key,
      this.buttonFunction,
      required this.text,
      this.buttonText});
  final VoidCallback? buttonFunction;
  final String text;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 35;
    return Container(
      height: 250,
      width: 200,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: ViewConstants.shadow),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('!',
              style: TextStyles.bold23(context: context)
                  .copyWith(color: AppColors.darkModePrimaryColor)),
          Text(text, style: TextStyles.regular14_150(context),textAlign: TextAlign.center),
          Visibility(
            visible: buttonText != null,
            child: OutlinedButton(
                onPressed: buttonFunction,
                child: Text(buttonText?? '',
                    style: TextStyles.semiBold16(context: context).copyWith(
                        color: Get.isDarkMode
                            ? AppColors.darkModePrimaryColor
                            : AppColors.lightModePrimaryColor))),
          )
        ],
      ),
    );
  }
}
