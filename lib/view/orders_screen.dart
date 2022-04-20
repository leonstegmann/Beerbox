import 'package:beerbox/view/fragments/order_fragment.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:beerbox/model/order.dart';

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
                      flex: 2,
                      child: Center(child: Text('ID')),
                    ),
                    Flexible(
                      flex: 2,
                      child: Center(child: Text('TABLE')),
                    ),
                    Flexible(
                      flex: 2,
                      child: Center(child: Text('ITEMS')),
                    ),
                    Flexible(
                      flex: 2,
                      child: Center(
                          child: Text('COSTS')),
                    ),
                    Flexible(
                      flex: 3,
                      child: Center(
                          child: Text('TIMESTAMP')),
                    ),
                    Flexible(
                      flex: 1,
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
                    return OrderFragment(widget.orderList[reverseIndex].item2, widget.orderList[reverseIndex].item1);
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
