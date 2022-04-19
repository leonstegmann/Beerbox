import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';

class ItemDisplay extends StatelessWidget {
  final ItemType? _itemType;

  const ItemDisplay([this._itemType]);

  @override
  Widget build(BuildContext context) {
    if (_itemType == null) {
      return SizedBox();
    } else {
      return Container(child: ListView(),);
    }
  }
}
