import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  Map<String, Map<String, String>> translations = {};

  Future<void> load() async {
    String jsonStringAr = await rootBundle.loadString('lib/core/localization/languages/ar.json');
    String jsonStringEn = await rootBundle.loadString('lib/core/localization/languages/en.json');

    translations['ar'] = Map<String, String>.from(json.decode(jsonStringAr));
    translations['en'] = Map<String, String>.from(json.decode(jsonStringEn));
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
