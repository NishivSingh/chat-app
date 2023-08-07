import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  CustomTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        fontSize: 28, fontWeight: FontWeight.bold, color: accentColor),
    displayMedium: GoogleFonts.montserrat(
        fontSize: 24, fontWeight: FontWeight.w700, color: accentColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w700, color: accentColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w600, color: accentColor),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w600, color: accentColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w600, color: accentColor),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.normal, color: accentColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.normal, color: accentColor),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        fontSize: 28, fontWeight: FontWeight.bold, color: whiteColor),
    displayMedium: GoogleFonts.montserrat(
        fontSize: 24, fontWeight: FontWeight.w700, color: whiteColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w700, color: whiteColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w600, color: whiteColor),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w600, color: whiteColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.normal, color: whiteColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.normal, color: whiteColor),
  );
}
