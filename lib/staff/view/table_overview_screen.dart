import 'package:beerbox/control/get_orders_from_tables.dart';
import 'package:beerbox/controll/order_provider.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/staff/view/fragments/table_button.dart';
import 'package:beerbox/staff/view/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/control/test_data.dart';

class TableOverview extends StatefulWidget {
  final OrderProvider _orderProvider = OrderProvider();

  TableOverview({Key? key}) : super(key: key);

  @override
  State<TableOverview> createState() => _TableOverviewState();
}

class _TableOverviewState extends State<TableOverview> {

  Future<Map<CustomerTable, List<Order>>> getNewData() async {
    final response = await widget._orderProvider.getOrdersPerTableMap();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    Future<Map<CustomerTable, List<Order>>> _actualOrdersPerTable = widget._orderProvider.getOrdersPerTableMap();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TableOverview',
        ),
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
      body: FutureBuilder(
      future: widget._orderProvider.getOrdersPerTableMap(),
      builder: (context, AsyncSnapshot<Map<CustomerTable, List<Order>>> snapshot){
    if (snapshot.hasError){
    final error = snapshot.error;
    return Text('$error');
    } else if (snapshot.connectionState == ConnectionState.done &&
    snapshot.data != null) {
      return Container(
        color: Colors.grey[850],
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TableButton(tables[0],snapshot.data!),
                  TableButton(tables[1]),
                  TableButton(tables[2]),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TableButton(tables[3]),
                  TableButton(tables[4]),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TableButton(tables[5]),
                  TableButton(tables[6]),
                  TableButton(tables[7]),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TableButton(tables[8]),
                  TableButton(tables[9]),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TableButton(tables[10]),
                  TableButton(tables[11]),
                  TableButton(tables[12]),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
      },
      ),
    );
  }
}
