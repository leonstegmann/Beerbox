import 'package:beerbox/control/customer_provider.dart';
import 'package:beerbox/control/item_provider.dart';
import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/control/table_provider.dart';
import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('order provider', () {

    final OrderProvider orderProvider = OrderProvider();

    test('readAll', () async {
      List<Order> orders = await orderProvider.readAll();
      orders.forEach((order) => print(order.toJsonMap()));
    });

    test('read', () async {
      Order orders = await orderProvider.read(1);
      print(orders.toJsonMap());
    });

    test('formattedRepresentation', () async {
      List<Order> orders = await orderProvider.readAll();
      print(orders.first.formattedRepresentation());
    });

    test('getOrdersPerTable', () async {
      Map<CustomerTable, List<Order>> ordersPerTable = await orderProvider.getOrdersPerTableMap();
      ordersPerTable.forEach((key, value) => print("$key => $value"));
    });
  });

  group('customer provider', () {

    final CustomerProvider customerProvider = CustomerProvider();

    test('readAll', () async {
      List<Customer> customers = await customerProvider.readAll();
      customers.forEach((customer) => print(customer.toJsonMap()));
    });
  });

  group('item provider', () {

    final ItemProvider itemProvider = ItemProvider();

    test('readAll', () async {
      List<Item> items = await itemProvider.readAll();
      items.forEach((item) => print(item.toJsonMap()));
    });
  });

  group('table provider', () {

    final TableProvider tableProvider = TableProvider();

    test('readAll', () async {
      List<CustomerTable> tables = await tableProvider.readAll();
      tables.forEach((table) => print(table.toJsonMap()));
    });
  });
}