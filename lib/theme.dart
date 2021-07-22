import 'package:flutter/material.dart';

var lightThemeData = new ThemeData(
    primaryColor: Colors.white,
    textTheme: new TextTheme(button: TextStyle(color: Colors.black),bodyText1: TextStyle(color: Colors.black)),
    brightness: Brightness.light);


var darkThemeData = ThemeData(
    primaryColor: Colors.white,
    textTheme: new TextTheme(button: TextStyle(color: Colors.white),bodyText1: TextStyle(color: Colors.white)),
    brightness: Brightness.dark);
