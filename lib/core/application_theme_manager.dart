import 'package:flutter/material.dart';

class Application_Theme_manager {
  static ThemeData LightThemeData = ThemeData(
    primaryColor:  Colors.blue,
    scaffoldBackgroundColor: const Color(0xFFDFECDB),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontFamily: "Poppins",
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 35,
        color: Color(0xFF5D9CEC),
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFC8C9CB),
        size: 30,
      ),
    ),
  );
  static ThemeData DarkThemeData = ThemeData(
    primaryColor: const Color(0xFF5D9CEC),
    scaffoldBackgroundColor: const Color(0xFF060e1e),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontFamily: "Poppins",
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF141922),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 35,
        color: Color(0xFF5D9CEC),
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFC8C9CB),
        size: 30,
      ),
    ),
  );
}
