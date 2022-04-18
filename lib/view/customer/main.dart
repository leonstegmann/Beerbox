import 'package:flutter/material.dart';
import 'package:beerbox/view/customer/item_menu.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ItemMenu(),
    );
  }
}
