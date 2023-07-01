import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:chat_app/src/utils/constants/size.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButtonTheme{
  CustomOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      foregroundColor: secondaryColor,
      side: const BorderSide(color: secondaryColor),
      padding: const EdgeInsets.symmetric(vertical: buttonheight)
    )
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      foregroundColor: whiteColor,
      side: const BorderSide(color: whiteColor),
      padding: const EdgeInsets.symmetric(vertical: buttonheight)
    )
  );
}