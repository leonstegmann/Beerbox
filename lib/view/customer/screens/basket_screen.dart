import 'package:beerbox/model/basket.dart';
import 'package:beerbox/model/item.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('proceed to payment'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                shape: const RoundedRectangleBorder(),
              ),
            ),
          ],
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text('1. Chosen Items:', style: TextStyle(fontSize: 25)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('name'),
              Text('Type'),
              Text('Cost'),
              Text('Amount'),
            ],
          ),
        ),
        Basket.instance.itemsInCart.isEmpty ? const Center(child:  Text('No Items!')) : const BasketItemList(),
      ]),
    );
  }
}

class BasketItemList extends StatelessWidget {
  const BasketItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: Basket.instance.itemsInCart.keys.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 30),
            child: BasketItem(
                item: Basket.instance.itemsInCart.entries.elementAt(index)),
          );
        },
      ),
    );
  }
}

class BasketItem extends StatelessWidget {
  const BasketItem({
    Key? key,
    required MapEntry<Item, int> item,
  })  : _item = item,
        super(key: key);

  final MapEntry<Item, int> _item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${_item.key.name}'),
            Text('${_item.key.itemType.name}'),
            Text('${_item.key.costs} NOK'),
            Text('${_item.value}x')
          ],
        ),
      ),
    );
  }
}
