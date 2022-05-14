import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:flutter/material.dart';

class ItemDisplay extends StatelessWidget {
  final List<Item> _itemList;
  final ItemType? itemType;

  const ItemDisplay(this._itemList, [this.itemType, Key? key])
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemType == null) {
      return const SizedBox();
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Items ${itemType.toString().split('.').last}s',
            style: Theme.of(context).textTheme.headline5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ListView.builder(
              shrinkWrap: true,
              //important for the flexible height
              physics: const ScrollPhysics(parent: null),
              scrollDirection: Axis.vertical,
              itemCount: _itemList.length,
              itemBuilder: (context, index) => itemCard(_itemList[index]),
            ),
          ),
        ],
      );
    }
  }
}

Widget itemCard(Item _item) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.cake),
          Text(_item.name.toString()),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_item.costs.toString()),
              const Text(' NOK'),
            ],
          ),
        ],
      ),
    ),
  );
}
