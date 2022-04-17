import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';

/**
 * Visualisation of order objects
 */
class OrderFragment extends StatelessWidget {

  final int _tableNumber;
  final Order _order;

  const OrderFragment(this._tableNumber, this._order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.blueGrey.shade800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(_order.id.toString()),
            flex: 1,
          ),
          Flexible(
            child: Text(_tableNumber.toString()),
            flex: 1,
          ),
          Flexible(
            child: Text(_order.items.length.toString()),
            flex: 1,
          ),
          Flexible(
            child: Row(
              children: [
                Text(_order.getFullCosts().toString()),
                Text(
                  'NOK',
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
            flex: 3,
          ),
          Flexible(
            child: Text(_order.timestamp.toString()),
            flex: 3,
          ),
          Flexible(
            child: IconButton(
              onPressed: () => print('printed'),
              icon: Icon(
                Icons.print,
                color: Colors.grey[100],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
