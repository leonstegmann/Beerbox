import 'package:beerbox/model/basket.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/view/customer/screens/menu_screen.dart';
import 'package:beerbox/view/customer/screens/submitOrder_screen.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    int _itemCount = Basket.instance.itemCounter();
    double _totalCost = Basket.instance.totalCosts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                )),
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
                  ),
                ),
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
                child: DisplayItemsAndTotalCost(_totalCost, _itemCount),
              ),
            ]
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton.extended(
          label: const Text('proceed'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubmitOrder(_totalCost, _itemCount)),
          ),
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

class DisplayItemsAndTotalCost extends StatelessWidget {
  final int _itemCount;
  final double _totalCost;

  const DisplayItemsAndTotalCost(this._totalCost, this._itemCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(child: Container()),
        const Flexible(child: Text('Items:')),
        Flexible(child: Text('${_itemCount.toString()}x')),
        Flexible(child: Container()),
        const Flexible(child: Text('Total:')),
        Flexible(child: Text('${_totalCost.toString()}  NOK')),
      ],
    );
  }
}
