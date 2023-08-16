import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/component/constance.dart';


ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22.0,
          color: Colors.black
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Jannah',
        color: Colors.black,
        fontSize: 19,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
          fontSize: 16,
          fontFamily: "Jannah",
          color: Colors.white
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 14
      )
    )
);

ThemeData darkMode = ThemeData(
  primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 22.0
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.black
      ),
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: 'Jannah',
          color: Colors.white,
          fontSize: 19,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
            fontSize: 16,
            fontFamily: "Jannah",
            color: Colors.white
        ),
        headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 14
        )
    )
);