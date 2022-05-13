import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/staff/view/fragments/table_button.dart';
import 'package:beerbox/staff/view/orders_screen.dart';
import 'package:flutter/material.dart';

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
    bool fill = false;
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
          builder: (context,
              AsyncSnapshot<Map<CustomerTable, List<Order>>> snapshot) {
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                    }),
              );
            } else {
              return const Center(child:  CircularProgressIndicator());
            }
          }),
    );
  }
}
