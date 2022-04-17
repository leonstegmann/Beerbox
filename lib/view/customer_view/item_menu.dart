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
            Container(
                padding: EdgeInsets.all( 10),
 //               color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cathegories', style: TextStyle(fontSize: 25),),
                    Container(height: 5,),
                    ItemTypeButtons(),
                  ],
                )),
            Container(height: 10,),
            Expanded( child: Column(
              children: [Text('Items',style: TextStyle(fontSize: 25),),
                ItemDisplay(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
