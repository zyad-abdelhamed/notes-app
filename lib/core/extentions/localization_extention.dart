  import 'package:notes_app/core/localization/languages/localization_proxy.dart';

BaseLocalization baseLocalization =LocalizationImpl();


extension ResponsiveExtention on String {
  String get localization => baseLocalization.localization[this];
}
