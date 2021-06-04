import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines custom application themes
class Themes {
  /// Light theme
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        textTheme: GoogleFonts.openSansTextTheme(
          ThemeData.light().textTheme,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: ThemeData.light().canvasColor,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        bottomAppBarColor: ThemeData.light().canvasColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          //foregroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade300,
        ),
      );

  /// Dark theme
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: ThemeData.dark().canvasColor,
        ),
        bottomAppBarColor: ThemeData.dark().canvasColor,
        textTheme: GoogleFonts.openSansTextTheme(
          ThemeData.dark().textTheme,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade800,
        ),
      );
}
