import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  Locale currentLanguage = Get.deviceLocale!;
  changeLanguage({required Languages language}) {
    switch (language) {
      case Languages.deviceLanguage:
        currentLanguage = Get.deviceLocale!;
      case Languages.arabic:
        currentLanguage = Locale('ar');
           update(); 
      case Languages.english:
        currentLanguage = Locale('en');
    }
  }
}

enum Languages { deviceLanguage, arabic, english }

class Localization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "splashcentertext": "دون ملاحظاتك",
          "hometitel": "ملاحظاتي",
          "DeviceLanguage":"لغه الجهاز",
          "AllFolders": "جميع\n  المجلدات",
          "AddNote": "إضافة\n  ملاحظه",
          "Title": "العنوان",
          "Write": "دون...",
          "FeaturedNotes": "الملاحظات\n  المميزه",
          "CreateNewFolder": "انشاء مجلد جديد",
          "searchhint": "search within my notes🔦",
          "alertdescription": "confirm the deletion process?",
          "alertaction1": "cancel",
          "alertaction2": "delete",
          "addpagetitle": "add note",
          "titlefieldhint": "the title",
          "bodyfieldhint": "write...",
          "localDataBaseErorr":""
        },
        "en": {
          "splashcentertext": "take notes",
          "hometitel": "My\n  Notes",
          "DeviceLanguage": "device language",
          "AllFolders": "All\n  folders",
          "AddNote": "Add\n  Note",
          "Title": "Title",
          "Write": "write...",
          "FeaturedNotes": "Featured\n  Notes",
          "CreateNewFolder": "create new folder",
          "searchhint": "search within my notes🔦",
          "alertdescription": "confirm the deletion process?",
          "alertaction1": "cancel",
          "alertaction2": "delete",
          "addpagetitle": "add note",
          "titlefieldhint": "the title",
          "bodyfieldhint": "write...",
          "localDataBaseErorr":""
        }
      };
}
