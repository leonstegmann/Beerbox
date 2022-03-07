import 'package:beerbox/model/Item.dart';

class OrderedItem {

  int _quantity;
  Item _item;

  OrderedItem(this._quantity, this._item);

  Item get item => _item;

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }
}