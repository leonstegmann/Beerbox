import 'package:beerbox/view/customer/display_of_items.dart';
import 'package:beerbox/view/customer/fragments/item_type_button.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/control/test_data.dart';
import 'package:beerbox/model/item.dart';

///
/// Loads MenuList for all following widgets.
/// Organises as subWidgets the ItemTypeButtons and the ItemList
///
class ItemMenu extends StatefulWidget {
  const ItemMenu({Key? key}) : super(key: key);

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

  void activateItemTypeField(ItemType newType){
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
                    const Text('Categories', style: TextStyle(fontSize: 25),),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          TypeButton(ItemType.values[0],activateItemTypeField),
                          Container(height: 10,),
                          TypeButton(ItemType.values[1],activateItemTypeField),
                        ]),
                        const SizedBox(width: 10,),
                        Column(children: [
                          TypeButton(ItemType.values[2],activateItemTypeField),
                          const SizedBox(height: 10,),
                          TypeButton(ItemType.values[3],activateItemTypeField),
                        ]),
                      ],
                    ),
                  ],
                )),
            const SizedBox(height: 10,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
