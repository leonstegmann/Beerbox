import 'package:beerbox/model/order.dart';

import 'db_object.dart';

class CustomerTable extends DbObject {

  final List<Order> orders;

  CustomerTable(int? id, this.orders) : super(id);

  @override
  factory CustomerTable.fromJson(Map<String, dynamic> json) => CustomerTable(
      json["_id"] as int,
      []); // TODO

  @override
  Map<String, dynamic> toJsonMap() => {
    '_id': id,
  };
}