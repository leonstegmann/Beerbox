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
    Order order = widget._order;
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => showData = !showData),
          child: Card(
            color: order.printed ?  Theme.of(context).shadowColor: Theme.of(context).cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(order.id.toString().padLeft(3, '0')),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(order.table.id.toString().padLeft(2, '0')),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(order.items.length.toString()),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(order.getFullCosts().toString()),
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
                    child: Text(dateTime2TimeString(order.timestamp)),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {
                      debugPrint(order.toString());
                      order.printed = true;
                      widget._orderProvider.update((order));
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
        showData ? OrderSubFragment(order) : const SizedBox(),
      ],
    );
  }
}
