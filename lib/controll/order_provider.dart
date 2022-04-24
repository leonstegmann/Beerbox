import 'package:beerbox/controll/data_provider.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/order.dart';

class OrderProvider extends DataProvider<Order> {

  final String view = "JoinedOrder";

  OrderProvider () : super('order');

  @override
  Future<Order> create(Order dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.create(tableName, dbObject);
    return Order.fromJson(response.first[tableName]!);
  }

  @override
  Future<Order> read(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.read(view, id);

    Order order = Order.fromJson(response.first[tableName]!);
    for (Map<String, Map<String, dynamic>> entry in response) {
      order.items.add(Item.fromJson(entry));
    }

    return order;
  }

  @override
  Future<List<Order>> readAll() async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.readAll(tableName);

    Map<int, Order> orders = {};
    for (Map<String, Map<String, dynamic>> entry in response) {

      Order order = Order.fromJson(entry[tableName]!);
      if (orders[order.id] == null) {
        orders[order.id!] = order;
      }

      orders[order.id]!.items.add(Item.fromJson(entry));
    }

    return orders.values.toList();
  }

  @override
  Future<Order> update(Order dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.update(tableName, dbObject);
    return Order.fromJson(response.first[tableName]!);
  }

  @override
  Future<Order> delete(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.delete(tableName, id);
    return Order.fromJson(response.first[tableName]!);
  }
}