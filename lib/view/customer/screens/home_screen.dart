import 'package:beerbox/view/customer/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Welcome to Bluebox!',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton.extended(
          label: const Text('Menu'),
          onPressed: () =>
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              ),
          backgroundColor: Theme.of(context).hintColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
