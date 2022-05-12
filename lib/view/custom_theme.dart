import 'package:flutter/material.dart';

class CustomTheme {

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo,
        accentColor: Colors.grey[800],
      ),
      highlightColor: Colors.grey[200],
      disabledColor: Colors.grey[500],
    );
  }
}