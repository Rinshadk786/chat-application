import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _themeData;
  final String _key = "isDarkMode";

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  void toggleTheme() async {
    _themeData = isDarkMode ? lightMode : darkMode;
    await _saveTheme(isDarkMode); // Save the new value
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool(_key) ?? false; // default to light
    _themeData = isDark ? darkMode : lightMode;
    notifyListeners();
  }

  Future<void> _saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDark);
  }
}
