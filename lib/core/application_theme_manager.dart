import 'package:flutter/material.dart';

class Application_Theme_manager {
  static ThemeData LightThemeData = ThemeData(
      primaryColor: Color(0xFF5D9CEC),
      scaffoldBackgroundColor: Color(0xFFDFECDB),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(
        color: Colors.white
      ),
      textTheme: TextTheme(
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
      ));
}
