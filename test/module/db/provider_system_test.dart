import 'package:beerbox/controll/customer_provider.dart';
import 'package:beerbox/controll/item_provider.dart';
import 'package:beerbox/controll/order_provider.dart';
import 'package:beerbox/controll/table_provider.dart';
import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgres/postgres.dart';

void main() {

  group('customer provider', () {

    final OrderProvider op = OrderProvider();

    test('getOrdersPerTable()', () async {
      Map<CustomerTable, List<Order>> ordersPerTable = await op.getOrdersPerTableMap();
      ordersPerTable.forEach((key, value) => print("$key => $value"));
    });
  });

  group('item provider', () {

    final ItemProvider itemProvider = ItemProvider();

    test('getOrdersPerTable()', () async {
      List<Item> items = await itemProvider.readAll();
      items.forEach((item) => print(item.toJsonMap()));
    });
  });

  group('table provider', () {

    final TableProvider tableProvider = TableProvider();

    test('getOrdersPerTable()', () async {
      List<CustomerTable> tables = await tableProvider.readAll();
      tables.forEach((table) => print(table.toJsonMap()));
    });
  });
}