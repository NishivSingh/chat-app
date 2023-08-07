import 'package:chat_app/src/utils/themes/app_bar.dart';
import 'package:chat_app/src/utils/themes/elevated_button_theme.dart';
import 'package:chat_app/src/utils/themes/input_decoration_theme.dart';
import 'package:chat_app/src/utils/themes/outlined_button_theme.dart';
import 'package:chat_app/src/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: CustomTextTheme.lightTextTheme,
      appBarTheme: CustomAppBarTheme.lightAppBarTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme:
          CustomInputDecorationTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: CustomTextTheme.darkTextTheme,
      appBarTheme: CustomAppBarTheme.darkAppBarTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme:
          CustomInputDecorationTheme.darkInputDecorationTheme);
}
