import 'package:beerbox/view/customer_view/display_of_items.dart';
import 'package:beerbox/view/customer_view/item_type_buttons.dart';
import 'package:flutter/material.dart';



class ItemMenu extends StatelessWidget {
  const ItemMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to Buebox',
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
        color: Colors.grey,
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    color: Colors.green,
                    child: ItemTypeButtons())),
            Flexible(flex: 3, child: ItemDisplay()),
          ],
        ),
      ),
    );
  }
}
