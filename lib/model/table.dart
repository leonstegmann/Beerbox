import 'package:beerbox/model/order.dart';

class CustomerTable {

  final int _id;
  final List<Order> _orders;

  CustomerTable(this._id, this._orders);

  List<Order> get orders => _orders;

  int get id => _id;
}