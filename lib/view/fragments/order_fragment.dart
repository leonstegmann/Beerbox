import 'package:beerbox/view/fragments/order_subfragment.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/testing/test_data.dart';
import 'package:beerbox/functions/FormatTime2String.dart';
import 'package:beerbox/view/fragments/order_subfragment.dart';

class OrderFragment extends StatefulWidget {
  final int _tableNumber;
  final int _orderNumber;

  const OrderFragment(this._tableNumber, this._orderNumber);

  @override
  State<OrderFragment> createState() => _OrderFragmentState();
}

class _OrderFragmentState extends State<OrderFragment> {
  bool showData = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              setState(() => showData = !showData);
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
//                color: Colors.teal,
                        child: Center(child: Text(tables[widget._tableNumber]
                            .orders[widget._orderNumber].id.toString().padLeft(
                            3, '0')))),
                  ),
                  Flexible(
                    child: Container(child: Center(child: Text(
                        tables[widget._tableNumber].id.toString().padLeft(
                            2, '0')))),
                    flex: 1,
                  ),
                  Flexible(
                    child: Container(
                      //              color: Colors.green,
                        child: Center(child: Text(tables[widget._tableNumber]
                            .orders[widget._orderNumber].items.length.toString()))),
                    flex: 1,
                  ),
                  Flexible(
                    child: Container(
                      //             color: Colors.red,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(tables[widget._tableNumber].orders[widget
                                ._orderNumber].getFullCosts().toString()),
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
                        child: Center(
                            child: Text(FormatTime2String(tables[widget
                                ._tableNumber].orders[widget._orderNumber]
                                .timestamp)))),
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
            ),
        ),
        showData ? OrderSubFragment(widget._tableNumber, widget._orderNumber): SizedBox()
      ],
    );
  }
}
