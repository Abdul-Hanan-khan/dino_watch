import 'package:flutter/material.dart';

import '../app_export.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: 'Popins',
    primaryColor: Colors.black,
    canvasColor: AppColors.secondaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.appColor,
    ),
    brightness: Brightness.light,
  );
}
