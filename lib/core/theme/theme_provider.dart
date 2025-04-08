import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/dark_theme_data.dart';
import 'package:notes_app/core/theme/light_theme_data.dart';

class ThemeProvider with ChangeNotifier {
  bool _darkMode = false;
  bool get darkMode => _darkMode;
  ThemeData _appTheme = getlighttheme;
  ThemeData get appTheme => _appTheme;
  void _setVaribles(ThemeData theme,bool darkMode) {
    _darkMode = darkMode;
    _appTheme = theme;
    notifyListeners();
  }
  void changeTheme() {
    _appTheme == getlighttheme ? _setVaribles(getdarktheme, true) : _setVaribles(getlighttheme, false);
  }
}
