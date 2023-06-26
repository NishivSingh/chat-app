import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:chat_app/src/utils/constants/size.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButtonTheme{
  CustomOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      foregroundColor: tSecondaryColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: buttonheight)
    )
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      foregroundColor: tWhiteColor,
      side: const BorderSide(color: tWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: buttonheight)
    )
  );
}