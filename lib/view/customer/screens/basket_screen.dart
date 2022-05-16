import 'package:beerbox/model/basket.dart';
import 'package:beerbox/model/item.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Basket.instance.itemsInCart.isEmpty) ...[
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Center(
                      child: Text(
                    'No Items!',
                    style: TextStyle(fontSize: 25),
                  )),
                )
              ] else ...[
                const Text('Chosen Items:', style: TextStyle(fontSize: 25)),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 10, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('name'),
                      Text('Type'),
                      Text('Cost'),
                      Text('Amount'),
                    ],
                  ),
                ),
                BasketItemList(setState),
                const SizedBox(height: 10),
                Container(
                  height: 2,
                  color: Theme.of(context).highlightColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: Container()),
                      const Flexible(child: Text('Items:')),
                      Flexible(
                          child: Text(
                              '${Basket.instance.itemCounter().toString()}x')),
                      Flexible(child: Container()),
                      const Flexible(child: Text('Total:')),
                      Flexible(
                          child: Text(
                              '${Basket.instance.totalCosts().toString()}  NOK')),
                    ],
                  ),
                ),
              ]
            ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton.extended(
          label: const Text('proceed to payment'),
          onPressed: () {},
          backgroundColor: Theme.of(context).hintColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class BasketItemList extends StatelessWidget {
  final StateSetter setState;

  const BasketItemList(
    this.setState, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: Basket.instance.itemsInCart.keys.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 30),
            child: BasketItem(setState,
                item: Basket.instance.itemsInCart.entries.elementAt(index)),
          );
        },
      ),
    );
  }
}

class BasketItem extends StatelessWidget {
  final MapEntry<Item, int> _item;
  final StateSetter setState;

  const BasketItem(
    this.setState, {
    Key? key,
    required MapEntry<Item, int> item,
  })  : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_item.key.name),
            Text(_item.key.itemType.name),
            Text('${_item.key.costs}  NOK'),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Basket.instance.removeItem(_item.key);
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove_circle),
                ),
                Text('${_item.value}x'),
                IconButton(
                  onPressed: () {
                    Basket.instance.addItem(_item.key);
                    setState(() {});
                  },
                  icon: const Icon(Icons.add_circle),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
