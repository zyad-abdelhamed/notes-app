import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalizationController {
  static Locale currentLanguage = Get.deviceLocale!;
  changeLanguage({required Languages language}) {
    switch (language) {
      case Languages.deviceLanguage:
        currentLanguage = Get.deviceLocale!;

      case Languages.arabic:
        currentLanguage = Locale('ar');

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
          "update": "تعديل",
          "add": "إضافة",
          "hometitel": "ملاحظاتي",
          "DeviceLanguage": "لغة الجهاز",
          "AllFolders": "جميع\n  المجلدات",
          "folder": "مجلد",
          "AddNote": "إضافة\n  ملاحظه",
          "Title": "العنوان",
          "Write": "دون...",
          "Favorites": "المفضلة",
          "CreateNewFolder": "إنشاء مجلد جديد",
          "SearchHint": "البحث ضمن ملاحظاتي",
          "DeleteConfirmation":"تأكيد الحذف",
          "AreYouSureYouWantToDeleteThisItem":"هل أنت متأكد أنك تريد حذف هذا العنصر؟",
          "Cancel": "إلغاء",
          "Delete": "حذف",
          "createdAt": "تاريخ الانشاء:",
          "lastUpdate": "آخر تحديث:",
          "localDataBaseErorr": ""
        },
        "en": {
          "update": "update",
          "add": "add",
          "hometitel": "My\n  Notes",
          "DeviceLanguage": "device language",
          "AllFolders": "All\n  folders",
          "folder": "folder",
          "AddNote": "Add\n  Note",
          "Title": "Title",
          "Write": "write...",
          "Favorites": "Favorites",
          "CreateNewFolder": "create new folder",
          "SearchHint": "search within my notes",
          "DeleteConfirmation": "Delete Confirmation",
          "AreYouSureYouWantToDeleteThisItem":"are you sure you want to delete this item?",
          "Cancel": "cancel",
          "Delete": "delete",
          "createdAt": "created At:",
          "lastUpdate": "last Update:",
          "Enter category name": "Enter category name",
          "this field can not be empty": "this field can not be empty",
          "there is no favorite notes": "there is no favorite notes",
          "there is no folders": "there is no folders",
          "add folder": "add folder",
          "there is no notes": "there is no notes",
          "add note": "add note",
          "there is no notes in this folder": "there is no notes in this folder",
          "localDataBaseErorr": ""
        }
      };
}
