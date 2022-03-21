import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableOrder extends StatelessWidget {
  final int tablenumber;

  const TableOrder(this.tablenumber);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Table ordered Items'),
        ),
        body: DefaultTextStyle(
            style: TextStyle(color: Colors.grey[100]),
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
              color: Colors.grey[750],
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      'Items from Table $tablenumber',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      columns: [
                        DataColumn(label: Text('Item')),
                        DataColumn(label: Text('Cost')),
                        DataColumn(label: Text('Ordering Time')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Beer')),
                          DataCell(Text('10 NOK')),
                          DataCell(Text('12.15')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Cider')),
                          DataCell(Text('15 NOK')),
                          DataCell(Text('11.00')),
                        ]),
                      ])
                ],
              ),
            )));
  }
}
