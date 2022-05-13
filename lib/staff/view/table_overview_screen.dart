import 'package:beerbox/control/get_orders_from_tables.dart';
import 'package:beerbox/staff/view/fragments/table_button.dart';
import 'package:beerbox/staff/view/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/control/test_data.dart';

class TableOverview extends StatefulWidget {
  const TableOverview({Key? key}) : super(key: key);

  @override
  State<TableOverview> createState() => _TableOverviewState();
}

class _TableOverviewState extends State<TableOverview> {

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
                  MaterialPageRoute(
                    builder: (context) =>
                        OrdersScreen(getOrdersFromTables(tables)),
                  ),
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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tables.length * 2,
            // double the length of the list in order to fit a spacing between each
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisExtent: 150,
            ),
            itemBuilder: (context, index) {
              int tableIndex = index ~/ 2; // integer division
              if (fill == false) {
                fill = !fill;
                return TableButton(tables[tableIndex]);
              } else {
                fill = !fill;
                --index;
                return const SizedBox(width: 50);
              }
            }),
      ),
    );
  }
}
