import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  applyElevationOverlayColor: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    elevation: 8,
    unselectedItemColor: Colors.green,
  ),
  appBarTheme: const AppBarTheme(
      color: Colors.black,
      actionsIconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      iconTheme: IconThemeData(color: Colors.red)),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
      //News app title
      displayMedium: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 20,
        color: Colors.white,
        fontFamily: 'google_fonts',
      ),

      //publishdAt
      displayLarge: TextStyle(
        fontFamily: 'google_fonts',
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.w300,
        overflow: TextOverflow.ellipsis,
      ),

      //article title
      displaySmall: TextStyle(
        fontFamily: 'google_fonts',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
      )),
  iconTheme: const IconThemeData(color: Colors.white),
);

MaterialColor defaultColor = Colors.red;

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,

  textTheme: const TextTheme(

      //News app title
      displayMedium: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontFamily: 'Kablammo-Regular',
      ),

      //publishdAt
      displayLarge: TextStyle(
        fontFamily: 'Kablammo-Regular',
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.w300,
        overflow: TextOverflow.ellipsis,
      ),

      //article title
      displaySmall: TextStyle(
        fontFamily: 'Kablammo-Regular',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        overflow: TextOverflow.ellipsis,
      )),

  iconTheme: const IconThemeData(color: Colors.white),

  appBarTheme: const AppBarTheme(
      color: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black)),
  primarySwatch: defaultColor,
  //scaffoldBackgroundColor: Colors.white,
  applyElevationOverlayColor: true,
  useMaterial3: true,

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.green,
    elevation: 8,
  ),
);

BottomNavigationBarThemeData bottomNAVBAR = const BottomNavigationBarThemeData(
  backgroundColor: Colors.white,
  unselectedItemColor: Colors.green,
  elevation: 8,
);
