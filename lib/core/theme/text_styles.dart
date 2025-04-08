import 'package:flutter/material.dart';
import 'package:notes_app/core/helper_function/get_responsive_font_size.dart';


class TextStyles {
  static TextStyle semiBold16(
      {required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context: context, fontSize: 16),
      height: 1.5, // 150%
    );
  }

  static TextStyle bold23(
      {required BuildContext context}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(context: context, fontSize: 23),
      height: 1.5, // 150%
    );
  }
  static TextStyle regular12(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,

      fontSize: getResponsiveFontSize(context: context, fontSize: 12),
      height: 1.2, // 120%
    );
  }

 

  static TextStyle regular14_150(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context: context, fontSize: 14),
      height: 1.5, // 150%
    );
  }

}
