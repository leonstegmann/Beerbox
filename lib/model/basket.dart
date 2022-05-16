import 'package:beerbox/model/item.dart';

class Basket {
  static final Basket instance = Basket._init();

  final Map<Item, int> itemsInCart = {};

  Basket._init();

  Map<Item, int> get items => itemsInCart;

  void addItem(Item item) {
    itemsInCart.putIfAbsent(item, () => 0);
    itemsInCart[item] = itemsInCart[item]! + 1;
  }

  void removeItem(Item item) {
    if (itemsInCart[item] == 1) {
      itemsInCart.remove(item);
    } else {
      itemsInCart[item] = itemsInCart[item]! - 1;
    }
  }

  double totalCosts() {
    double totalCost = 0.0;
    for (Item _item in itemsInCart.keys) {
      totalCost = totalCost + _item.costs * itemsInCart[_item]!;
    }
    return totalCost;
  }

  int itemCounter() {
    int _itemCounter = 0;
    for (var i in itemsInCart.values) {
      _itemCounter = _itemCounter + i;
    }
    return _itemCounter;
  }
}
