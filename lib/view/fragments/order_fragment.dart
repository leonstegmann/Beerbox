import 'package:beerbox/view/fragments/order_subfragment.dart';
import 'package:beerbox/utils/format_time_to_string.dart';
import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';

///
/// Visualisation of order objects.
///
class OrderFragment extends StatefulWidget {
  final int _tableNumber;
  final Order _order;

  const OrderFragment(this._tableNumber, this._order, {Key? key})
      : super(key: key);

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
            color: Colors.grey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      child: Center(
                          child: Text(widget._order.id.toString().padLeft(3, '0')))),
                ),
                Flexible(
                  child: Container(
                      child: Center(
                          child:
                              Text(widget._tableNumber.toString().padLeft(2, '0')))),
                  flex: 1,
                ),
                Flexible(
                  child: Container(
                      child:
                          Center(child: Text(widget._order.items.length.toString()))),
                  flex: 1,
                ),
                Flexible(
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget._order.getFullCosts().toString()),
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
                      child: Center(
                          child: Text(
                              formatDateTime2TimeString(widget._order.timestamp)))),
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
        showData ? OrderSubFragment(widget._order) : const SizedBox()
      ],
    );
  }
}
