import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/utils/time_utils.dart';
import 'package:beerbox/view/staff/screens/fragments/time_display.dart';
import 'package:beerbox/view/staff/screens/orders_screen.dart';
import 'package:flutter/material.dart';

/// Creates clickable Table Icon with Orders and TableNumber
class TableButton extends StatefulWidget {
  // final is necesarry as it is a Stateless Widget which cant change
  final CustomerTable table;
  final List<Order> _currentOrdersPerTable;

  const TableButton(this.table, this._currentOrdersPerTable, {Key? key})
      : super(key: key);

  @override
  State<TableButton> createState() => _TableButtonState();
}

class _TableButtonState extends State<TableButton> {
  //Constructor
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          child: InkWell(
            splashColor: Theme.of(context).splashColor,
            hoverColor: Theme.of(context).hoverColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersScreen(table: widget.table),
                ),
              );
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                //Methode Ink.image()) lässt sich nicht skalieren
                Image.asset(
                  'assets/table.png',
                  color: Theme.of(context).cardColor,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TimeSinceOldestOrder(orders: widget._currentOrdersPerTable),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Orders:   ',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(400),
                          color: Theme.of(context).hintColor,
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Text(
                              ' ${widget._currentOrdersPerTable.length}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 0,
                      height: 8,
                    ),
                    Text(
                      'TableNr: ${widget.table.id}',
                      style: const TextStyle(fontSize: 10),
                    ),
                    const SizedBox(
                      width: 0,
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeSinceOldestOrder extends StatelessWidget {

  final List<Order> orders;

  final TextStyle minuteStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  final TextStyle secondStyle = const TextStyle(fontSize: 12);

  const TimeSinceOldestOrder({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (orders.isEmpty) {
      return const Text("", style: TextStyle());
    }

    return TimeDisplay(
      time: getTimePast(Order.getOldestOrder(orders)),
      minuteStyle: minuteStyle,
      secondStyle: secondStyle,
    );
  }
}
