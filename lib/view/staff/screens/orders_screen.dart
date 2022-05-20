import 'dart:async';
import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/view/staff/screens/fragments/order_fragment.dart';
import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';

///  Displays incoming list of orders.
class OrdersScreen extends StatefulWidget {
  final CustomerTable? table;
  final OrderProvider _orderProvider = OrderProvider();

  OrdersScreen({this.table, Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  Stream<Future<List<Order>>>? _orderStream;
  late StreamSubscription _sub;
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  Stream<Future<List<Order>>> get orderStream {
    _orderStream ??= Stream.periodic(const Duration(seconds: 2), (int count) async {
      if (widget.table == null) {
        return widget._orderProvider.readAll();
      }
      return widget._orderProvider.getOrdersPerTable(widget.table!);
    });

    return _orderStream!;
  }

  @override
  void initState() {
    _sub = orderStream.listen((orders) {
      orders.then((value) {
        setState(() {
          _orders = value;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Builder(
        builder: (context) {
          if (_orders.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return OrderDisplay(sortOrders(_orders));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

class OrderDisplay extends StatelessWidget {
  final List<Order> orders;

  const OrderDisplay(this.orders, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
      child: Column(
        children: [
          const OrderProperties(),
          Expanded(
            child: ListView.builder(
              physics: const ScrollPhysics(parent: null),
              itemCount: orders.length, //listLength,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                int reversedIndex = orders.length - 1 - index;
                return OrderFragment(orders[reversedIndex]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderProperties extends StatelessWidget {
  const OrderProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          OrderProperty(2, 'ID'),
          OrderProperty(2, 'TABLE'),
          OrderProperty(2, 'ITEMS'),
          OrderProperty(2, 'COSTS'),
          OrderProperty(3, 'TIMESTAMP'),
          OrderProperty(1, ''),
        ],
      ),
    );
  }
}

class OrderProperty extends StatelessWidget {
  final int flex;
  final String text;

  const OrderProperty(this.flex, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(flex: flex, child: Center(child: Text(text)));
  }
}

List<Order> sortOrders(List<Order> sortedOrderList){
  sortedOrderList.sort((a, b) {
    if(b.printed) {
      return 1;
    }
    return -1;
  });

  return sortedOrderList;
}