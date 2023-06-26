import 'package:chat_app/src/utils/themes/elevated_button_theme.dart';
import 'package:chat_app/src/utils/themes/outlined_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.grey,
      appBarTheme: AppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme
      );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.grey,
      appBarTheme: AppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme
      );
}
