import 'package:beerbox/model/item.dart';

class Basket {
  static final Basket instance = Basket._init();

  final Map<Item, int> itemsInCart = {};

  Basket._init();

  void addItem(Item item) {
    itemsInCart.putIfAbsent(item, () => 0);
    itemsInCart[item] = itemsInCart[item]! + 1;
  }

  void removeItem(Item item) {
    if(itemsInCart[item] == 1){
      itemsInCart.remove(item);
    } else{
      itemsInCart[item] = itemsInCart[item]! - 1;
    }
  }

  /// Getter
  Map<Item, int> get items => itemsInCart;

  double totalCosts() {
    double totalCost = 0;
    for (Item _item in itemsInCart.keys ){
      totalCost = totalCost + _item.costs * itemsInCart[_item]!;
    }
    return totalCost;
  }

  int itemCounter() {
    int _itemcounter = 0;
    for (Item _item in itemsInCart.keys ){
      _itemcounter = _itemcounter +  itemsInCart[_item]!;
    }
    return _itemcounter;
  }
}