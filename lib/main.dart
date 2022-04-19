import 'package:beerbox/view/table_overview_screen.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TableOverview(),
    );
  }
}
