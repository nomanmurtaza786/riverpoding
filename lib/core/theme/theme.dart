import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superwizor/core/theme/superwizor_color.dart';
import 'package:superwizor/core/theme/superwizor_text_theme.dart';
import 'superwizor_radius.dart';



class SuperwizorTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: SuperwizorColor.primaryColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: SuperwizorColor.primaryColor,
      onPrimary: SuperwizorColor.onPrimaryColor,
      secondary: Colors.purple,
      onSecondary: Colors.brown,
      error: SuperwizorColor.errorColor,
      onError: Colors.orange,
      background: SuperwizorColor.backgroundColor,
      onBackground: SuperwizorColor.onBackgroundColor,
      surface: Colors.yellowAccent,
      onSurface: SuperwizorColor.blackTextColor,
      tertiary: SuperwizorColor.tertiaryColor,

    ),
    textTheme: SuperwizorTextTheme.textTheme,
    // colorScheme: ColorScheme(
        // brightness: Brightness.light,
        // primary: SuperwizorColor.primaryColor,
        // onPrimary: SuperwizorColor.onPrimaryColor,
    // ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(180,50),
          backgroundColor: SuperwizorColor.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SuperwizorRadius.cornerRadius100),
          ),
          textStyle: GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1,),
        ),
    ),
    // inputDecorationTheme: const InputDecorationTheme(
    //   iconColor: SolarColor.greyDarkColor,),
    // splashColor: SolarColor.splashColor,
    // primaryColor: SolarColor.whiteColor,

  );
}
