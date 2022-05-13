import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/staff/view/fragments/order_fragment.dart';
import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';


///
///  Displays incoming list of orders.
///
class OrdersScreen extends StatefulWidget {
  final CustomerTable? table;
//  final Future<List<Order>> orderList;
  final OrderProvider _orderProvider = OrderProvider();

  OrdersScreen( {this.table, Key?key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  Widget build(BuildContext context) {
    int listLength = 0;//widget.orderList.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
        ),
      ),
      body: FutureBuilder(
        future: widget._orderProvider.readAll(), // returns Future<List<Order>>
        builder: (context, AsyncSnapshot<List<Order>> snapshot) {
          if (snapshot.hasError){
            final error = snapshot.error;
            return Text('$error');
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
//            List<Order>? orders = snapshot.data;
            return DefaultTextStyle(
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
                        itemCount: snapshot.data?.length, //listLength,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          int reverseIndex = listLength - 1 - index;
                          return OrderFragment(snapshot.data![reverseIndex]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
