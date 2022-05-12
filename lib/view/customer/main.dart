import 'package:beerbox/view/customer/home_screen.dart';
import 'package:flutter/material.dart';

///
/// Main for Customer side
///
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluebox',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          accentColor: Colors.grey[800],
        ),
        highlightColor: Colors.grey[200],
        disabledColor: Colors.grey[500],
      ),
      home: HomeScreen(),
    );
  }
}
