import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';

class OrderSubFragment extends StatelessWidget {
  final Order _order;

  const OrderSubFragment(this._order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double extendableHeight = _order.items.length * 21;
    return Column(
      children: [
        SizedBox(
          height: extendableHeight,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _order.items.length,
            itemBuilder: (context, itemIndex) {
              return OrderedItem(_order.items[itemIndex]);
            },
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class OrderedItem extends StatelessWidget {
  final Item _item;

  const OrderedItem(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(left: 40, right: 5),
          color: Theme.of(context).primaryColor,
          child: Row(
            children: [
              const Flexible(
                flex: 1,
                child: Center(child: Text('')),
              ),
              Flexible(
                flex: 4,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_item.name),
                      Text(
                        '   (${_item.itemType.toString().split('.').last})',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_item.costs.toString()),
                      const Text(
                        'NOK',
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ),
              const Flexible(flex: 4, child: Center(child: Text(''))),
            ],
          ),
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
