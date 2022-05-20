import 'dart:async';
import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/view/staff/screens/fragments/table_button.dart';
import 'package:beerbox/view/staff/screens/orders_screen.dart';
import 'package:flutter/material.dart';

class TableOverview extends StatefulWidget {
  static final OrderProvider _orderProvider = OrderProvider();

  const TableOverview({Key? key}) : super(key: key);

  @override
  State<TableOverview> createState() => _TableOverviewState();
}

class _TableOverviewState extends State<TableOverview> {
  final Stream<Future<Map<CustomerTable, List<Order>>>> _ordersPerTableStream =
      Stream.periodic(const Duration(seconds: 1), (int count) async {
    return await TableOverview._orderProvider
        .getOrdersPerTableMap(useAllTables: true, ignorePrinted: true);
  });

  late StreamSubscription _sub;

  Map<CustomerTable, List<Order>> _currentOrdersPerTable = {};

  @override
  void initState() {
    _sub = _ordersPerTableStream.listen((ordersPerTable) {
      ordersPerTable.then((value) {
        setState(() {
          _currentOrdersPerTable = value;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Overview'),
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
      body: Builder(
        builder: (context) {
          if (_currentOrdersPerTable.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return TableGridView(ordersPerTable: _currentOrdersPerTable);
        },
      ),
    );
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

class TableGridView extends StatelessWidget {
  final Map<CustomerTable, List<Order>> _ordersPerTable;

  const TableGridView({
    Key? key,
    required Map<CustomerTable, List<Order>> ordersPerTable,
  })  : _ordersPerTable = ordersPerTable,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool fill = false;
    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        // double the length of the list in order to fit a spacing between each
        itemCount: _ordersPerTable.keys.length * 2,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisExtent: 150,
        ),
        itemBuilder: (context, index) {
          int tableIndex = index ~/ 2; // integer division
          if (fill == false) {

            fill = true;
            return TableButton(
              _ordersPerTable.keys.elementAt(tableIndex),
              _ordersPerTable.values.elementAt(tableIndex),
            );
          } else {

            fill = false;
            --index;
            return const SizedBox(width: 50);
          }
        },
      ),
    );
  }
}
