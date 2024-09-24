import 'package:flutter/material.dart';
import 'package:zens_assignment/datas/app_color.dart';

class AppConfig {
  static ColorScheme colorScheme = ColorScheme(
    shadow: Colors.blue,
    brightness: Brightness.light,
    primary: AppColor.mediumGreen,
    onPrimary: AppColor.mediumGreen,
    secondary: AppColor.textSecondaryColor,
    onSecondary: AppColor.textSecondaryColor,
    tertiary: Colors.white,
    onTertiary: Colors.black,
    error: Colors.red,
    onError: Colors.redAccent,
    background: Colors.white,
    onBackground: Colors.white,
    surface: Colors.white,
    onSurface: Colors.white,
  );

  static TextTheme textTheme = TextTheme(
    bodyMedium: TextStyle(fontSize: 15, color: AppColor.textPrimaryColor),
    bodySmall: TextStyle(fontSize: 12, color: AppColor.textSecondaryColor), 
    displayMedium: TextStyle(fontSize: 16, color: AppColor.primaryWhiteColor),
    displaySmall: TextStyle(fontSize: 14, color: AppColor.primaryWhiteColor),
    labelLarge: TextStyle(fontSize: 16, color: AppColor.primaryWhiteColor),
  );
}