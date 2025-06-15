import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColor.getMaterialColor(AppColor.themeColor),
      ),
      textTheme: _textTheme,

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        border: _getInputBorder(AppColor.themeColor),
        enabledBorder: _getInputBorder(AppColor.themeColor),
        focusedBorder: _getInputBorder(AppColor.themeColor),
        errorBorder: _getInputBorder(Colors.red),
      ),
    );
  }

  static OutlineInputBorder _getInputBorder(Color color){
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: .4,
      ),
      headlineMedium: TextStyle(fontSize: 16, color: Colors.grey),
    );
  }
}
