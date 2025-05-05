import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key,
      required this.contentWidget,
      required this.onTap,
      required this.buttonText,
      required this.title});
  final String title, buttonText;
  final WidgetBuilder contentWidget;
  final VoidCallback onTap;
  static const double borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    final double width = context.width * .65;

    return GestureDetector(
      onTap:Get.back,

      child: Scaffold(
        backgroundColor: AppColors.grey.withValues(alpha: .2),
        body: Center(
          child: Container(
            width: width,
            height: width * .85,
            decoration: _boxDecorationToSuperContainer,
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyles.bold23(context: context).copyWith(
                      color: AppColors.black, fontWeight: FontWeight.normal),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: contentWidget(context),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: width * .20,
                    decoration: _boxDecorationToSubContainer,
                    child: Text(buttonText,
                        style: TextStyles.semiBold16(context: context)
                            .copyWith(color: AppColors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration get _boxDecorationToSubContainer {
    return BoxDecoration(
        color: AppColors.darkModePrimaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius)));
  }

  BoxDecoration get _boxDecorationToSuperContainer {
    return BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius));
  }
}
