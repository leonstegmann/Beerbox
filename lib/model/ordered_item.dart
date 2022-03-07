import 'package:beerbox/model/item.dart';

class OrderedItem {

  int quantity;
  final Item _item;

  OrderedItem(this.quantity, this._item);

  Item get item => _item;
}