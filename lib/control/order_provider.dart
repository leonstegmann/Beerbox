import 'package:beerbox/control/data_provider.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';

/// Most important [DataProvider] as it manages the database access of the [Order]'s.
class OrderProvider extends DataProvider<Order> {

  final String view = "joined_order";

  OrderProvider () : super('order');

  @override
  Future<Order> create(Order dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.create(tableName, dbObject);
    return read(response.first[tableName]!["order_id"]);
  }

  @override
  Future<Order> read(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.read(tableName, id, view: view);
    if (response.isEmpty) {
      throw DbEntryNotFoundException(tableName, id);
    }

    Order order = Order.fromJson(response.first[""]!);
    for (Map<String, Map<String, dynamic>> entry in response) {
      Map<String, dynamic> itemJson = entry[""]!;
      if (Item.jsonContainsItem(itemJson)) {
        order.items.add(Item.fromJson(itemJson));
      }
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

      if (Item.jsonContainsItem(entryJson)) {
        orders[order.id]!.items.add(Item.fromJson(entryJson));
      }
    }

    return orders.values.toList();
  }

  @override
  void update(Order dbObject) async {
    dbCrud.update(tableName, dbObject);
  }

  @override
  void delete(int id) async {
    dbCrud.delete(tableName, id);
  }

  Future<Map<CustomerTable, List<Order>>> getOrdersPerTableMap() async {
    List<Order> orders = await readAll();

    Map<CustomerTable, List<Order>> ordersPerTable = {};
    for (Order order in orders) {
      ordersPerTable.putIfAbsent(order.table, () => []);
      ordersPerTable[order.table]!.add(order);
    }

    return ordersPerTable;
  }

  Future<List<Order>> getOrdersPerTable(CustomerTable table) async {
    Map<CustomerTable, List<Order>> ordersPerTable = await getOrdersPerTableMap();
    return ordersPerTable.containsKey(table) ? ordersPerTable[table]! : [];
  }
}