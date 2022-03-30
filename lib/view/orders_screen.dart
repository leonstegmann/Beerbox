import 'package:flutter/material.dart';
import '../functions/FormatTime2String.dart';
import 'package:beerbox/testing/test_data.dart';
import '../testing/test_function_1.dart';

class OrdersScreen extends StatefulWidget {
  final int _tableNumber;
  const OrdersScreen( this._tableNumber );

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
        ),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.grey[100]),
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          color: Colors.grey[850],
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.grey[700],
                child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  //                        color: Colors.teal,
                    child: Center(child: Text('ID'))),
                flex: 1,
              ),
              Flexible(
                child: Center(child: Text('TABLE')),
                flex: 1,
              ),
              Flexible(
                child: Center(child: Text('ITEMS')),
                flex: 1,
              ),
              Flexible(
                child: Container(
                  //                      color: Colors.red,
                    child: Center(child: Text('COSTS'))),
                flex: 1,
              ),
              Flexible(
                child: Container(
                  //                  color: Colors.pink,
                    child: Center(child: Text('TIMESTAMP'))),
                flex: 2,
              ),
              Flexible(
                child: Center(child: Text('')),
              ),
            ],
          ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tables[widget._tableNumber].orders.length ,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    int reverse_index = tables[widget._tableNumber].orders.length - 1 - index;
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
//                color: Colors.teal,
                                child: Center(child: Text(tables[widget._tableNumber].orders[reverse_index].id.toString().padLeft(3, '0')))),
                          ),
                          Flexible(
                            child: Container(child: Center(child: Text(tables[widget._tableNumber].id.toString().padLeft(2, '0')))),
                            flex: 1,
                          ),
                          Flexible(
                            child: Container(
                              //              color: Colors.green,
                                child: Center(child: Text(tables[widget._tableNumber].orders[reverse_index].items.length.toString()))),
                            flex: 1,
                          ),
                          Flexible(
                            child: Container(
                              //             color: Colors.red,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(tables[widget._tableNumber].orders[reverse_index].getFullCosts().toString()),
                                    Text(
                                      'NOK',
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Container(
                              //              color: Colors.pink,
                                child: Center(child: Text(FormatTime2String(tables[widget._tableNumber].orders[reverse_index].timestamp)))),
                            flex: 2,
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: () => print('printed'),
                              icon: Icon(
                                Icons.print,
                                color: Colors.grey[100],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
