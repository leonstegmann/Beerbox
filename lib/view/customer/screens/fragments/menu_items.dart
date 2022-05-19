import 'package:beerbox/model/basket.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:flutter/material.dart';

class ItemDisplay extends StatelessWidget {
  final List<Item> _itemList;
  final ItemType? itemType;
  final StateSetter stateSetterMenuScreen;

  const ItemDisplay(this.stateSetterMenuScreen, this._itemList, [this.itemType, Key? key])
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
              itemBuilder: (context, index) =>
                  itemCard(_itemList[index], stateSetterMenuScreen),
            ),
          ),
        ],
      );
    }
  }
}

Widget itemCard(Item _item, StateSetter setState) {
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
              const SizedBox(width: 30),
              AddItemButton(_item, setState),
            ],
          ),
        ],
      ),
    ),
  );
}

class AddItemButton extends StatelessWidget {
  final Item _item;
  final StateSetter setState;

  const AddItemButton(this._item, this.setState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'ADD to basket',
      onPressed: () {
        Basket.instance.addItem(_item);
        setState(() {});
      },
      icon: const Icon(Icons.add),
    );
  }
}
