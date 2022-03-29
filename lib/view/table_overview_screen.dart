
import 'package:beerbox/view/fragments/table_button.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/testdata/test_data.dart';

class TableOverview extends StatefulWidget {
  const TableOverview({Key? key}) : super(key: key);

  @override
  State<TableOverview> createState() => _TableOverviewState();
}

class _TableOverviewState extends State<TableOverview> {



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