import 'package:flutter/material.dart';

class Application_Theme_manager {
  static ThemeData LightThemeData = ThemeData(
      primaryColor: Color(0xFF5D9CEC),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: "El Messiri",
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFB7935F),
        selectedLabelStyle: TextStyle(fontFamily: "El Messiri", fontSize: 16),
        unselectedLabelStyle: TextStyle(fontFamily: "El Messiri", fontSize: 14),
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF222222),
        selectedIconTheme: IconThemeData(size: 35, color: Color(0xFF222222)),
        unselectedItemColor: Color(0xFFF8F8F8),
        unselectedIconTheme: IconThemeData(size: 28, color: Color(0xFFF8F8F8)),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        bodySmall: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ));

}
