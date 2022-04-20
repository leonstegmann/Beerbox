import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/utils/format_time_to_string.dart';

///
///  Displays incoming list of orders.
///
class OrdersScreen extends StatefulWidget {
  final List<Tuple2<Order, int>> orderList;

  const OrdersScreen(this.orderList , {Key?key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  Widget build(BuildContext context) {
    int listLength = widget.orderList.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
        ),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.grey[100]),
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
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
                child: Center(child: Text('ID')),
                flex: 1,
              ),
              Flexible(
                child: Center(child: Text('TABLE')),
                flex: 1,
              ),
              Flexible(
                child: Center(child: Text('ITEMS')),
                flex: 1,
              ),
              Flexible(
                child: Center(child: Text('COSTS')),
                flex: 1,
              ),
              Flexible(
                child: Center(child: Text('TIMESTAMP')),
                flex: 2,
              ),
              Flexible(
                child: Center(child: Text('')),
              ),
            ],
          ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const ScrollPhysics(parent: null),
                  itemCount: listLength,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    int reverseIndex = listLength - 1 - index;
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Center(child: Text(widget.orderList[reverseIndex].item1.id.toString().padLeft(3, '0'))),
                          ),
                          Flexible(
                            child: Center(child: Text(widget.orderList[reverseIndex].item2.toString().padLeft(2, '0'))),
                            flex: 1,
                          ),
                          Flexible(
                            child: Center(child: Text(widget.orderList[reverseIndex].item1.items.length.toString())),
                            flex: 1,
                          ),
                          Flexible(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.orderList[reverseIndex].item1.getFullCosts().toString()),
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
                            child: Center(child: Text(formatDateTime2TimeString(widget.orderList[reverseIndex].item1.timestamp))),
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
