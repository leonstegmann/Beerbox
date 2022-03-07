import 'package:beerbox/model/Order.dart';

class Table {

  int _id;
  List<Order> _orders;

  Table(this._id, this._orders);

  List<Order> get orders => _orders;

  int get id => _id;
}