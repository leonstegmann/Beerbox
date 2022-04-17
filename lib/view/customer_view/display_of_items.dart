import 'package:flutter/material.dart';

class ItemDisplay extends StatelessWidget {
  final String? _itemType;

  const ItemDisplay([this._itemType]);

  @override
  Widget build(BuildContext context) {
    if (_itemType == null) {
      return SizedBox();
    } else {
      return Container(child: ListView());
    }
  }
}
