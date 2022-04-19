import 'package:beerbox/view/customer/display_of_items.dart';
import 'package:beerbox/view/customer/item_type_buttons.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu({Key? key}) : super(key: key);

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    ItemType? _itemType;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
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
                    Text('Categories', style: TextStyle(fontSize: 25),),
                    Container(height: 5,),
                    ItemTypeButtons(),
                  ],
                )),
            Container(height: 10,),
            Expanded( child: Column(
              children: [
                Text('Items ${_itemType.toString()}',style: TextStyle(fontSize: 25),),
                ItemDisplay(_itemType),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
