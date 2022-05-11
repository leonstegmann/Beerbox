import 'package:beerbox/view/customer/display_of_items.dart';
import 'package:beerbox/view/customer/fragments/categories.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/control/test_data.dart';
import 'package:beerbox/model/item.dart';

///
/// Loads MenuList for all following widgets.
/// Organises as subWidgets the ItemTypeButtons and the ItemList
///
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ItemType? loadedItemType;

  final List<List<Item>> _loadedItemList = [
    items.where((i) => i.itemType == ItemType.beer).toList(),
    items.where((i) => i.itemType == ItemType.cocktail).toList(),
    items.where((i) => i.itemType == ItemType.shot).toList(),
    items.where((i) => i.itemType == ItemType.snack).toList(),
  ];

  void activateItemTypeField(ItemType newType) {
    setState(() {
      loadedItemType = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
        color: Colors.grey,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Categories(activateItemTypeField),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (loadedItemType == ItemType.values[0])
                  ItemDisplay(_loadedItemList[0], loadedItemType),
                if (loadedItemType == ItemType.values[1])
                  ItemDisplay(_loadedItemList[1], loadedItemType),
                if (loadedItemType == ItemType.values[2])
                  ItemDisplay(_loadedItemList[2], loadedItemType),
                if (loadedItemType == ItemType.values[3])
                  ItemDisplay(_loadedItemList[3], loadedItemType),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
