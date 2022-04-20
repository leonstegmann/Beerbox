import 'package:flutter/material.dart';
import 'package:beerbox/testing/test_data.dart';
import 'package:beerbox/view/fragments/order_fragment.dart';

class OrdersScreen extends StatefulWidget {
  final int _tableNumber;
  const OrdersScreen( this._tableNumber );

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
//  bool showData = false;

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
                margin: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.grey[700],
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Flexible(
                      flex: 2,
                      child: Center(child: Text('ID')),
                    ),
                    Flexible(
                      flex: 2,
                      child: Center(child: Text('TABLE')),
                    ),
                    Flexible(
                      flex: 2,
                      child: Center(child: Text('ITEMS')),
                    ),
                    Flexible(
                      flex: 2,
                      child: Center(
                          child: Text('COSTS')),
                    ),
                    Flexible(
                      flex: 3,
                      child: Center(
                          child: Text('TIMESTAMP')),
                    ),
                    Flexible(
                      child: Center(child: Text('')),
                    ),
                  ],
          ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tables[widget._tableNumber].orders.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    int reverseIndex = tables[widget._tableNumber].orders.length - 1 - index;
                    return OrderFragment(widget._tableNumber, reverseIndex);
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

