import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:chat_app/src/utils/constants/size.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: whiteColor,
          backgroundColor: lightAccentColor,
          side: const BorderSide(color: lightAccentColor),
          padding: const EdgeInsets.symmetric(vertical: buttonheight),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))));
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: blackColor,
          backgroundColor: darkAccentColor,
          side: const BorderSide(color: darkAccentColor),
          padding: const EdgeInsets.symmetric(vertical: buttonheight),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))));
}
