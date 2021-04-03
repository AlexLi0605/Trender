import 'package:flutter/material.dart';

BorderRadius get cardRadius => BorderRadius.circular(12.0);

ThemeData get appTheme => ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      // This makes the visual density adapt to the platform that you run
      // the app on. For desktop platforms, the controls will be smaller and
      // closer together (more dense) than on mobile platforms.
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

AppBarTheme get appBarTheme => const AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      elevation: 0,
      centerTitle: true,
    );
