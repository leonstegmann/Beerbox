import 'package:beerbox/view/customer/display_of_items.dart';
import 'package:beerbox/view/customer/fragments/item_type_button.dart';
import 'package:beerbox/view/customer/item_type_buttons.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/control/test_data.dart';
import 'package:beerbox/model/item.dart';

class ItemMenu extends StatefulWidget {
  ItemMenu({Key? key}) : super(key: key);

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {

  ItemType? loadedItemType;

  final List<List<Item>> _loadedItemList = [
    items.where((i) => i.itemTypeId == 0).toList(),
    items.where((i) => i.itemTypeId == 1).toList(),
    items.where((i) => i.itemTypeId == 2).toList(),
    items.where((i) => i.itemTypeId == 3).toList(),
  ];

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(10),
                //color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories', style: TextStyle(fontSize: 25),),
                    Container(height: 5,),
                    Container(
              //      color: Colors.blue, //Test Color
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: [
                            TypeButton(ItemType.values[0]),
                            Container(height: 10,),
                            TypeButton(ItemType.values[1]),
                          ]),
                          Container(width: 10,),
                          Column(children: [
                            TypeButton(ItemType.values[2]),
                            Container(height: 10,),
                            TypeButton(ItemType.values[3]),
                          ]),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(height: 10,),
            Expanded(
                child: Column(
              children: [
                if (loadedItemType==ItemType.values[0]) ItemDisplay(_loadedItemList[0],loadedItemType),
                if (loadedItemType==ItemType.values[1]) ItemDisplay(_loadedItemList[1],loadedItemType),
                if (loadedItemType==ItemType.values[2]) ItemDisplay(_loadedItemList[2],loadedItemType),
                if (loadedItemType==ItemType.values[3]) ItemDisplay(_loadedItemList[3],loadedItemType),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
