import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superwizor/core/theme/superwizor_color.dart';

abstract class SuperwizorTextStyle {
  static TextStyle headlineLarge = GoogleFonts.raleway(
      fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  static TextStyle headlineMedium = GoogleFonts.raleway(
      fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  static TextStyle headlineSmall =
      GoogleFonts.raleway(fontSize: 49, fontWeight: FontWeight.w400);
  static TextStyle titleLarge = GoogleFonts.raleway(
      fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  static TextStyle titleMedium =
      GoogleFonts.raleway(fontSize: 24, fontWeight: FontWeight.w400);
  static TextStyle titleSmall = GoogleFonts.raleway(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15);
  static TextStyle displayLarge = GoogleFonts.raleway(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
  static TextStyle displayMedium = GoogleFonts.raleway(
      fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.1,color: SuperwizorColor.blackTextColor);
  static TextStyle displaySmall = GoogleFonts.sourceSansPro(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: SuperwizorColor.primaryColor);
  static TextStyle labelLarge = GoogleFonts.sourceSansPro(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  static TextStyle labelMedium = GoogleFonts.sourceSansPro(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4);
  static TextStyle labelSmall = GoogleFonts.sourceSansPro(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25);
  static TextStyle bodyLarge = GoogleFonts.sourceSansPro(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
