import'package:flutter/material.dart';

enum ThemeModeType {
  light,
  dark,
}

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeData _themeData = ThemeData.light();
  ThemeModeType _themeModeType = ThemeModeType.light;

  ThemeData getTheme() => _themeData;
  ThemeModeType getThemeModeType() => _themeModeType;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _themeModeType =
        _themeModeType == ThemeModeType.light ? ThemeModeType.dark : ThemeModeType.light;
    _themeData = _themeModeType == ThemeModeType.light ? ThemeData.light() : ThemeData.dark();
    notifyListeners();
  }
}
