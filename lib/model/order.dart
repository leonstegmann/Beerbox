import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';

class Order {

  final int _id;
  final DateTime _timestamp;
  final Customer _customer;
  final List<Item> _items;

  Order(this._id, this._timestamp, this._customer, this._items);

  double getFullCosts() {

    double fullCosts = 0;
    for(Item item in _items) {
      fullCosts += item.costs;
    }

    return fullCosts;
  }

  int get id => _id;
  DateTime get timestamp => _timestamp;
  Customer get customer => _customer;
  List<Item> get items => _items;
}