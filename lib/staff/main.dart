import 'package:beerbox/staff/view/home_screen.dart';
import 'package:beerbox/view/custom_theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluebox',
      theme: CustomTheme.dark(),
      home: const HomeScreen(),
    );
  }
}
