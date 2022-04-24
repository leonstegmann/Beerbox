import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/db_object.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/table.dart';

class Order extends DbObject {

  final DateTime timestamp;
  final Customer customer;
  final CustomerTable table;
  final List<Item> items;

  Order(int id, this.timestamp, this.customer, this.table, this.items) : super(id);

  @override
  factory Order.fromJson(Map<String, dynamic> json) => Order(
      json["order_id"] as int,
      json["timestamp"] as DateTime,
      Customer.fromJson(json),
      CustomerTable.fromJson(json),
      []);

  @override
  Map<String, dynamic> toJsonMap() => {
    'order_id': id,
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