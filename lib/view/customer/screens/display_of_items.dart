import 'package:beerbox/model/item.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';

class ItemDisplay extends StatelessWidget {
  final List<Item> _itemList;
  final ItemType? itemType;

  const ItemDisplay(this._itemList, [this.itemType, Key? key])
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemType == null) {
      return SizedBox();
    } else {
      return Column(
        children: [
          Text(
            'Items ${itemType.toString().split('.').last}s',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      );
    }
  }
}
