import 'package:beerbox/controll/data_provider.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';

class OrderProvider extends DataProvider<Order> {

  final String view = "joined_order";

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
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.readAll(view);

    Map<int, Order> orders = {};
    for (Map<String, Map<String, dynamic>> entry in response) {

      Map<String, dynamic> entryJson = entry[""]!;
      Order order = Order.fromJson(entryJson);
      if (orders[order.id] == null) {
        orders[order.id!] = order;
      }

      orders[order.id]!.items.add(Item.fromJson(entryJson));
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

  Future<Map<CustomerTable, List<Order>>> getOrdersPerTable() async {
    List<Order> orders = await readAll();

    Map<CustomerTable, List<Order>> ordersPerTable = {};
    for (Order order in orders) {
      ordersPerTable.putIfAbsent(order.table, () => []);
      ordersPerTable[order.table]!.add(order);
    }

    return ordersPerTable;
  }
}