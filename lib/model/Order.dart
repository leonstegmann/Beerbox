import 'package:beerbox/model/Customer.dart';
import 'package:beerbox/model/OrderedItem.dart';

class Order{

  int _id;
  int _timestamp;
  Customer _customer;
  List<OrderedItem> _orderedItems;

  Order(this._id, this._timestamp, this._customer, this._orderedItems);

  int get id => _id;

  int get timestamp => _timestamp;

  Customer get customer => _customer;

  List<OrderedItem> get orderedItems => _orderedItems;
}