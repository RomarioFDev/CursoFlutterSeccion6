import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Colors.amber[800]!;

  static final ThemeData theme = ThemeData.light().copyWith(
    //Color principal
    primaryColor: primary,

    //Tema para los appbar
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    //Tema para los TextButton
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

    // ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: primary,
      shape: const StadiumBorder(),
    )),

    // FloatingActionButton
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primary),

    //inputDecorationTheme
    inputDecorationTheme: InputDecorationTheme(
      focusColor: primary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ),
  );
}
