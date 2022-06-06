import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurTheme {
  Color _lightRed = Color(0xFFEF5350);
  Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  Color _darkGrey = Color.fromARGB(255, 119, 124, 135);
  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: _lightRed,
        primaryColor: _lightRed,
        accentColor: _lightGrey,
        secondaryHeaderColor: _darkGrey,
        hintColor: _lightGrey,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: _darkGrey,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          minWidth: 150,
          height: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ));
  }
}
