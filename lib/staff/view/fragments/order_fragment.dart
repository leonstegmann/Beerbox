import 'package:beerbox/view/fragments/order_subfragment.dart';
import 'package:beerbox/utils/format_time_to_string.dart';
import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

///
/// Visualisation of order objects.
///
class OrderFragment extends StatefulWidget {
  final Tuple2<Order, int> _order;  //Tuple of <Order, TableNumber>

  const OrderFragment(this._order, {Key? key}) : super(key: key);

  @override
  State<OrderFragment> createState() => _OrderFragmentState();
}

class _OrderFragmentState extends State<OrderFragment> {
  bool showData = false;

  @override
  Widget build(BuildContext context) {
    Order _order = widget._order.item1;
    int _tableNumber = widget._order.item2;
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
                      child: Text(_order.id.toString().padLeft(3, '0'))),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                      child:
                          Text(_tableNumber.toString().padLeft(2, '0'))),
                ),
                Flexible(
                  child: Center(child: Text(_order.items.length.toString())),
                  flex: 1,
                ),
                Flexible(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_order.getFullCosts().toString()),
                        const Text(
                          'NOK',
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Flexible(
                  flex: 2,
                  child: Center(
                      child: Text(formatDateTime2TimeString(_order.timestamp))),),
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
        showData ? OrderSubFragment(_order) : const SizedBox()
      ],
    );
  }
}
