import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {

  TAppTheme._();
  
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(displayMedium: GoogleFonts.montserrat(
      color: Colors.blueGrey,
    )));



  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(displayMedium: GoogleFonts.montserrat(
      color: Colors.blueGrey,
    )));
}