import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'),),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('proceed to payment'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                shape: const RoundedRectangleBorder(),
              ),
            ),
          ],
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.0),
          child:  Text('1. Chosen Items:', style: TextStyle(fontSize: 25)),
        ),
        myItems(),
      ]),
    );
  }
}

  Widget myItems() {
    return Flexible(
      flex: 1,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 30),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Align(alignment: Alignment.centerLeft,child: Text('ItemName')),
                  const Align(alignment: Alignment.centerRight, child: Text('Amount'),)
                ],
              ),
            ),
          )),
    );
}
