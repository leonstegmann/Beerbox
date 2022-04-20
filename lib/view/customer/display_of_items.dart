import 'package:beerbox/model/item.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/control/test_data.dart';

class ItemDisplay extends StatelessWidget {
  final ItemType? _itemType;
  final List<Item> _itemList;
  const ItemDisplay(this._itemList,[this._itemType]);

  @override
  Widget build(BuildContext context) {
    if (_itemType == null) {
      return SizedBox();
    } else {
      return Container(child: Column(
        children: [
          Text('Items ${_itemType.toString()}',style: TextStyle(fontSize: 25),),
          ListView(),
        ],
      ));
    }
  }
}
