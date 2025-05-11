import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/routes_constants.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/core/theme/theme_controller.dart';

List<Widget> appBarActions(BuildContext context) {
  final ThemeController themeController = Get.find();
  String language;
 
  final List<String> languagesStrings = <String>[
    "DeviceLanguage".tr,
    ...ViewConstants.constantsLanguagesStrings
  ];

  return [
    IconButton(
      onPressed: () {
        Get.toNamed(RoutesConstants.favoriteNotesPageRouteName);
      },
      icon: const Icon(Icons.favorite, color: Colors.red),
    ),
    IconButton(
      onPressed: () {
        Get.toNamed(RoutesConstants.searchScreenPageRouteName);
      },
      icon: const Icon(Icons.search),
    ),
    Obx(() => IconButton(
          onPressed: () {
            themeController.changeTheme(
              themeController.currentThemeMode.value == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
            
          icon: Icon(themeController.currentThemeMode.value == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.light_mode),
        )),
        IconButton(
        onPressed: () {
          Get.bottomSheet(Column(
            children: List.generate(
              languagesStrings.length,
              (index) => TextButton(
                  onPressed: () {
                    language = languagesStrings[index];
                    if (language == 'English') {
                      Get.updateLocale(Locale('en'));
                    } else if (language == 'العربيه') {
                      Get.updateLocale(Locale('ar'));
                    }
                    Get.back();
                  },
                  child: Text(languagesStrings[index],
                      style: TextStyles.bold23(context: context)
                          .copyWith(color: Colors.white))),
            ),
          ));
        },
        icon: Icon(Icons.language))
  ];
}
