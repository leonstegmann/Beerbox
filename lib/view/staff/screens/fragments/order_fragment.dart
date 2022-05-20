import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/view/staff/screens/fragments/extended_order_fragment.dart';
import 'package:beerbox/utils/time_utils.dart';
import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';

/// Visualisation of order objects.
class OrderFragment extends StatefulWidget {
  final Order _order; //Tuple of <Order, TableNumber>
  final OrderProvider _orderProvider = OrderProvider();

  OrderFragment(this._order, {Key? key}) : super(key: key);

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
          onTap: () => setState(() => showData = !showData),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(widget._order.id.toString().padLeft(3, '0')),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(widget._order.table.id.toString().padLeft(2, '0')),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(widget._order.items.length.toString()),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget._order.getFullCosts().toString()),
                        const Text(
                          'NOK',
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Center(
                    child: Text(dateTime2TimeString(widget._order.timestamp)),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {
                      debugPrint(widget._order.formattedRepresentation());
                      widget._orderProvider.update((widget._order));
                    },
                    icon: Icon(
                      Icons.print,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        showData ? OrderSubFragment(widget._order) : const SizedBox(),
      ],
    );
  }
}
