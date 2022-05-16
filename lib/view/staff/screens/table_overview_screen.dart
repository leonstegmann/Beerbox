import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/view/staff/screens/fragments/table_button.dart';
import 'package:beerbox/view/staff/screens/orders_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TableOverview extends StatelessWidget {
  TableOverview({Key? key}) : super(key: key);

  final Stream<Map<CustomerTable, List<Order>>> ordersPerTableStream =
      (() async* {
    final OrderProvider orderProvider = OrderProvider();
    const MapEquality mapEquality = MapEquality();

    Map<CustomerTable, List<Order>> oldState = {};
    while (true) {
      Map<CustomerTable, List<Order>> ordersPerTable = await orderProvider
          .getOrdersPerTableMap(useAllTables: true)
          .timeout(const Duration(seconds: 5));

      if (!mapEquality.equals(oldState, ordersPerTable)) {
        oldState = ordersPerTable;
        yield ordersPerTable;
      }

      await Future<void>.delayed(const Duration(seconds: 5));
    }
  })();

  @override
  Widget build(BuildContext context) {
    bool fill = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableOverview'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersScreen()),
                );
              },
              child: const Icon(
                Icons.arrow_forward,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<Map<CustomerTable, List<Order>>>(
        stream: ordersPerTableStream,
        builder:
            (context, AsyncSnapshot<Map<CustomerTable, List<Order>>> snapshot) {
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Text('$error');
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            int _tablesListLength = snapshot.data!.keys.length;
            return Container(
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _tablesListLength * 2,
                // double the length of the list in order to fit a spacing between each
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) {
                  int tableIndex = index ~/ 2; // integer division
                  if (fill == false) {
                    fill = !fill;
                    return TableButton(
                        snapshot.data!.keys.elementAt(tableIndex),
                        snapshot.data!.values.elementAt(tableIndex));
                  } else {
                    fill = !fill;
                    --index;
                    return const SizedBox(width: 50);
                  }
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
