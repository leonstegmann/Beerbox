import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/ordered_item.dart';

class Order {

  final int _id;
  final int _timestamp;
  final Customer _customer;
  final List<OrderedItem> _orderedItems;

  Order(this._id, this._timestamp, this._customer, this._orderedItems);

  double getFullCosts() {

    double fullCosts = 0;
    for(OrderedItem oredredItem in _orderedItems) {
      fullCosts += oredredItem.item.costs;
    }

    return fullCosts;
  }

  int get id => _id;

  int get timestamp => _timestamp;

  Customer get customer => _customer;

  List<OrderedItem> get orderedItems => _orderedItems;
}