import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomInputDecorationTheme {
  CustomInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: lightAccentColor)),
          prefixIconColor: lightAccentColor,
          floatingLabelStyle: TextStyle(color: lightAccentColor),
          fillColor: lightAccentColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: lightAccentColor)));
  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: darkAccentColor,
          enabledBorder:
              OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: darkAccentColor)),
          floatingLabelStyle: TextStyle(color: darkAccentColor),
          fillColor: darkAccentColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: darkAccentColor)));
}
