import 'package:flutter/material.dart';
import 'table_overview_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text(
          'Beerbox',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        color: Colors.grey[850],
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome to Bluebox',
              style: TextStyle(fontSize: 60),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: const Text('Table Overview'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TableOverview()),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
