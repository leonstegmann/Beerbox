import 'package:flutter/material.dart';
import 'OrdersScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(
          'Bluebox',
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        color: Colors.grey[850],
        alignment: Alignment.center,
        child: ElevatedButton(
          child: Text('Orders'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrdersScreen()),
            );
          },
        ),
      ),
    );
  }
}
