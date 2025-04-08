import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

extension ResponsiveExtention on BuildContext {
  ThemeProvider get themeController => Provider.of<ThemeProvider>(this);
}
