import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_app/core/constants/routes_constants.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/dark_theme_data.dart';
import 'package:notes_app/core/theme/light_theme_data.dart';
import 'package:notes_app/core/theme/text_styles.dart';

List<Widget> appBarActions(BuildContext context) {
    final IconData themeIcon =
        Get.isDarkMode ? Icons.light_mode : Icons.dark_mode;
    final List<String> languagesStrings = <String>[
      "DeviceLanguage".tr,
      ...ViewConstants.constantsLanguagesStrings
    ];
    return [
      IconButton(
          onPressed: () {
            Get.toNamed(RoutesConstants.featuredNotesPageRouteName);
          },
          icon: Icon(Icons.star)),
      IconButton(onPressed: () {
        Get.toNamed(RoutesConstants.searchScreenPageRouteName);
      }, icon: Icon(Icons.search)),
      IconButton(
          onPressed: () {
            if (Get.isDarkMode) {
              Get.changeTheme(getlighttheme);
            } else {
              Get.changeTheme(getdarktheme);
            }
          },
          icon: Icon(themeIcon)),
      IconButton(
          onPressed: () {
            Get.bottomSheet(Column(
              children: List.generate(
                languagesStrings.length,
                (index) => TextButton(
                    onPressed: () {},
                    child: Text(languagesStrings[index],
                        style: TextStyles.bold23(context: context)
                            .copyWith(color:Colors.white))),
              ),
            ));
          },
          icon: Icon(Icons.language))
    ];
  }