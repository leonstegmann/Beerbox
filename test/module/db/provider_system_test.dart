import 'package:beerbox/control/customer_provider.dart';
import 'package:beerbox/control/item_provider.dart';
import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/control/table_provider.dart';
import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgres/postgres.dart';

void main() {

  group('direct execution', () {
    test('Create order', () async {
      PostgreSQLConnection connection = PostgreSQLConnection(
          "ec2-34-247-72-29.eu-west-1.compute.amazonaws.com",
          5432,
          "dgdob5fr7i8io",
          username: "kyfrrzmlxuxpzl",
          password: "bf33dbc056e5dbdb3dd731373035b0d09d7272e1a8c74adc0ebf8d99108d86dd",
          useSSL: true);

      await connection.open();

      List<Map<String, Map<String, dynamic>>> response = await connection.mappedResultsQuery('INSERT INTO "order"(customer_id, table_id) VALUES (1, 1) RETURNING * JOINING ');
      print(response);
    });
  });


  group('order provider', () {

    final OrderProvider orderProvider = OrderProvider();

    test('create', () async {
      Order orders = await orderProvider.create(Order.creat(1, 1, [1, 1, 5]));
      print(orders.toJsonMap());
    });

    test('read', () async {
      Order order = await orderProvider.read(26);
      print(order.toJsonMap());
    });

    test('readAll', () async {
      List<Order> orders = await orderProvider.readAll();
      orders.forEach((order) => print(order.toJsonMap()));
    });

    test('formattedRepresentation', () async {
      List<Order> orders = await orderProvider.readAll();
      print(orders.first.formattedRepresentation());
    });

    test('getOrdersPerTable', () async {
      Map<CustomerTable, List<Order>> ordersPerTable = await orderProvider.getOrdersPerTableMap();
      ordersPerTable.forEach((key, value) => print("$key => $value"));
    });
    
    test('update', () async {
      Order order = await orderProvider.read(28);
      order.customer = Customer.reference(3);
      orderProvider.update(order);
      Order updatedOrder = await orderProvider.read(order.id!);
      print(updatedOrder.toJsonMap());
    });

    test('delete', () async {
      orderProvider.delete(36);
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