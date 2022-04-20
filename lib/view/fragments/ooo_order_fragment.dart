import 'package:beerbox/model/order.dart';
import 'package:beerbox/utils/format_time_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

/**
 * Visualisation of order objects
 */
class OrderFragment extends StatelessWidget {
  final int _tableNumber;
  final Order _order;

  const OrderFragment(this._tableNumber, this._order, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.blueGrey.shade800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Container(
//                color: Colors.teal,
                child: Center(child: Text(_order.id.toString()))),
          ),
          Flexible(
            child: Container(child: Center(child: Text(_tableNumber.toString()))),
            flex: 1,
          ),
          Flexible(
            child: Container(
  //              color: Colors.green,
                child: Center(child: Text(_order.items.length.toString()))),
            flex: 1,
          ),
          Flexible(
            child: Container(
 //             color: Colors.red,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_order.getFullCosts().toString()),
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
                child: Center(child: Text(formatDateTime2TimeString(_order.timestamp)))),
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
  }
}
