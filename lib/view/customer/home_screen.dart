import 'package:beerbox/view/customer/menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Flexible(flex: 1,
                child: Text('Welcome to Bluebox!', style: Theme.of(context).textTheme.headline5)),
            Flexible(flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: Text('Order'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Menu()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
