import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/db_object.dart';
import 'package:beerbox/model/item.dart';

class Order extends DbObject {

  final DateTime timestamp;
  final Customer customer;
  final List<Item> items;

  Order(int id, this.timestamp, this.customer, this.items) : super(id);

  @override
  factory Order.fromJson(Map<String, dynamic> json) => Order(
      json["_id"] as int,
      DateTime.fromMillisecondsSinceEpoch(json["timestamp"] as int),
      Customer(null, "placeholder"), // TODO
      []); // TODO

  @override
  Map<String, dynamic> toJsonMap() => {
    '_id': id,
    'timestamp': "'${timestamp.microsecondsSinceEpoch}'",
    'customer_id': "'${customer.id}'",
  };

  double getFullCosts() {

    double fullCosts = 0;
    for(Item item in items) {
      fullCosts += item.costs;
    }

    return fullCosts;
  }
}