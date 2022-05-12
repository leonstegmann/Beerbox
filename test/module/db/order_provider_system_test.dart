import 'package:beerbox/controll/customer_provider.dart';
import 'package:beerbox/controll/order_provider.dart';
import 'package:beerbox/model/customer.dart';
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
}