import 'package:flutter/material.dart';

abstract class CustomTheme {

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo,
        accentColor: Colors.grey[800],
      ),
      primaryColor: Colors.grey,
      cardColor: Colors.grey[600],
      highlightColor: Colors.grey[200],
      disabledColor: Colors.grey[500],
      hintColor: Colors.orange,
      shadowColor: Colors.grey[800],
    );
  }

  static List<Color> trafficLight = [
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.yellow,
    Colors.orangeAccent,
    Colors.deepOrangeAccent,
    Colors.redAccent
  ];
}