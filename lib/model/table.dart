import 'package:beerbox/model/order.dart';

class Table {

  final int _id;
  final List<Order> _orders;

  Table(this._id, this._orders);

  List<Order> get orders => _orders;

  int get id => _id;
}