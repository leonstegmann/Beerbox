import 'package:beerbox/view/customer/menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        color: Colors.grey[850],
        alignment: Alignment.center,
        child: Column(
          children: [
            Flexible(flex: 1,
                child: Text('Welcome to Bluebox!', style: TextStyle(fontSize: 30),)),
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

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Home',
      ),
    );
  }
}
