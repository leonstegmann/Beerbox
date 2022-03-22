import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/view/fragments/table_button.dart';
import 'package:flutter/material.dart';

class TableOverview extends StatefulWidget {
  const TableOverview({Key? key}) : super(key: key);

  @override
  State<TableOverview> createState() => _TableOverviewState();
}

class _TableOverviewState extends State<TableOverview> {

  final List<CustomerTable> tables = [
    CustomerTable(0, [Order(1, DateTime.now(), Customer(0, "Olaf"), [Item(id: 0, name: "Pils", costs: 7.2, itemTypeId: ItemType.beer.index)])]),
    CustomerTable(1, []),
    CustomerTable(2, []),
    CustomerTable(3, []),
    CustomerTable(4, []),
    CustomerTable(5, []),
    CustomerTable(6, []),
    CustomerTable(7, []),
    CustomerTable(8, []),
    CustomerTable(9, []),
    CustomerTable(10, []),
    CustomerTable(11, []),
    CustomerTable(12, []),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TableOverview',
        ),
      ),
      body: Container(
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
                  TableButton(tables[0]),
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
      ),
    );
  }
}