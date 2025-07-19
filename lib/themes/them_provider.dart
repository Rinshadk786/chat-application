import 'package:flutter/material.dart';
import 'package:signal/thems/light_mode.dart';

import 'dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    notifyListeners();
  }
}
