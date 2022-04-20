import 'package:beerbox/view/fragments/order_subfragment.dart';
import 'package:beerbox/utils/format_time_to_string.dart';
import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/testing/test_data.dart';
import 'package:beerbox/functions/FormatTime2String.dart';

///
/// Visualisation of order objects.
///
class OrderFragment extends StatefulWidget {
  final int _tableNumber;
  final Order _order;

  const OrderFragment(this._tableNumber, this._order, {Key? key}) : super(key: key);

  @override
  State<OrderFragment> createState() => _OrderFragmentState();
}

class _OrderFragmentState extends State<OrderFragment> {
  bool showData = false;

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
                child: Center(child: Text(_order.id.toString()))),
          ),
          Flexible(
            child: Container(child: Center(child: Text(_tableNumber.toString()))),
            flex: 1,
          ),
          Flexible(
            child: Container(
                child: Center(child: Text(_order.items.length.toString()))),
            flex: 1,
          ),
          Flexible(
            child: Container(
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
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              setState(() => showData = !showData);
            },
            child: Card(
              color: Colors.grey[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                        child: Text(tables[widget._tableNumber].orders[widget._orderNumber].id.toString().padLeft(3, '0'))),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(
                        child: Text(tables[widget._tableNumber].id.toString().padLeft(2, '0'))),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(
                        child: Text(tables[widget._tableNumber].orders[widget._orderNumber].items.length.toString())),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tables[widget._tableNumber].orders[widget._orderNumber].getFullCosts().toString()),
                          const Text('NOK',style: TextStyle(fontSize: 8),),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Center(
                        child: Text(FormatTime2String(tables[widget._tableNumber].orders[widget._orderNumber].timestamp))),
                  ),
                  Flexible(
                    child: IconButton(
                      onPressed: () => print('printed'),
                      icon: const Icon(
                        Icons.print,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
        showData ? OrderSubFragment(widget._tableNumber, widget._orderNumber): const SizedBox()
      ],
    );
  }
}
