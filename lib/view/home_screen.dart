import 'package:flutter/material.dart';
import 'orders_screen.dart';
import 'TableOverview.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: Text('Orders'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersScreen()),
                );
              },
            ),

            SizedBox(height: 10),

            ElevatedButton(
              child: const Text('Table Overview'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TableOverview()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
