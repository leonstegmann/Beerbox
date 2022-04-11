import 'package:flutter/material.dart';
import 'table_overview_screen.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome to Bluebox',
              style: TextStyle(fontSize: 50),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  child: const Text('Table Overview'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TableOverview()),
                    );
                  },
                )
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
