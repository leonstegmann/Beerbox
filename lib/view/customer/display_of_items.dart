import 'package:beerbox/model/item.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';

class ItemDisplay extends StatelessWidget {
  final ItemType? _itemType;
  final List<Item> _itemList;
  const ItemDisplay(this._itemList, [this._itemType]);

  @override
  Widget build(BuildContext context) {
    if (_itemType == null) {
      return SizedBox();
    } else {
      return Container(child: Column(
        children: [
          Text(
            'Items ${_itemType.toString().split('.').last}s',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ));
    }
  }
}
