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
          "add": "اضافه",
          "delete": "حذف",
          "hometitel": "ملاحظاتي",
          "DeviceLanguage": "لغه الجهاز",
          "AllFolders": "جميع\n  المجلدات",
          "AddNote": "إضافة\n  ملاحظه",
          "Title": "العنوان",
          "Write": "دون...",
          "FeaturedNotes": "الملاحظات\n  المميزه",
          "CreateNewFolder": "انشاء مجلد جديد",
          "SearchHint": "البحث ضمن ملاحظاتي",
          "DeleteConfirmation":"تأكيد الحذف",
          "AreYouSureYouWantToDeleteThisItem":"هل أنت متأكد أنك تريد حذف هذا العنصر؟",
          "Cancel": "حذف",
          "Delete": "إلغاء",
          "localDataBaseErorr": ""
        },
        "en": {
          "update": "update",
          "add": "add",
          "delete": "delete",
          "hometitel": "My\n  Notes",
          "DeviceLanguage": "device language",
          "AllFolders": "All\n  folders",
          "AddNote": "Add\n  Note",
          "Title": "Title",
          "Write": "write...",
          "FeaturedNotes": "Featured\n  Notes",
          "CreateNewFolder": "create new folder",
          "SearchHint": "search within my notes",
          "DeleteConfirmation": "Delete Confirmation",
          "AreYouSureYouWantToDeleteThisItem":"are you sure you want to delete this item?",
          "Cancel": "cancel",
          "Delete": "delete",
          "localDataBaseErorr": ""
        }
      };
}
