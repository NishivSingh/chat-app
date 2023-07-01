import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:chat_app/src/utils/constants/size.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonTheme{
  CustomElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: whiteColor,
      backgroundColor: secondaryColor,
      side: const BorderSide(color: secondaryColor),
      padding: const EdgeInsets.symmetric(vertical: buttonheight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
    )
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: secondaryColor,
      backgroundColor: whiteColor,
      side: const BorderSide(color: whiteColor),
      padding: const EdgeInsets.symmetric(vertical: buttonheight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
    )
  );
}