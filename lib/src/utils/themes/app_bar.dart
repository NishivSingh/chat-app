import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    color: accentColor,
  );
  static const darkAppBarTheme = AppBarTheme(
    color: primaryColor,
    foregroundColor: darkColor,
  );
}
