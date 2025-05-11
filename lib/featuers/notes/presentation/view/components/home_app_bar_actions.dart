import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/cache_constants.dart';
import 'package:notes_app/core/constants/routes_constants.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/services/cache_service.dart';
import 'package:notes_app/core/services/dependency_injection.dart';
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
    Obx(() {
      final isDark = themeController.currentThemeMode.value == ThemeMode.dark;

      return IconButton(
        onPressed: () {
          themeController.changeTheme(
            isDark ? ThemeMode.light : ThemeMode.dark,
          );
        },
        icon: Icon(
          isDark ? Icons.dark_mode : Icons.light_mode,
          color: isDark ? Colors.white : Colors.black,
        ),
      );
    }),
    IconButton(
        onPressed: () {
          Get.bottomSheet(Column(
            children: List.generate(
              languagesStrings.length,
              (index) => TextButton(
                onPressed: () async {
                  language = languagesStrings[index];

                  if (language == 'English') {
                    await sl<BaseCache>().insertStringToCache(
                        key: CacheConstants.lang, value: 'en');
                    Get.updateLocale(const Locale('en'));
                  } else if (language == 'العربيه') {
                    await sl<BaseCache>().insertStringToCache(
                        key: CacheConstants.lang, value: 'ar');
                    Get.updateLocale(const Locale('ar'));
                  }

                  Get.back();
                },
                child: Text(
                  languagesStrings[index],
                  style: TextStyles.bold23(context: context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ));
        },
        icon: Icon(Icons.language))
  ];
}
