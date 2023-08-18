import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    color: lightAccentColor,
  );
  static const darkAppBarTheme = AppBarTheme(
    color: darkAccentColor,
    foregroundColor: darkColor,
  );
}
