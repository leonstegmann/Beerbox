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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: FutureBuilder(
        future: getFuture(),
        builder: (context, AsyncSnapshot<List<Order>> snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return OrderDisplay(snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Order>> getFuture() {
    if (widget.table == null) {
      return widget._orderProvider.readAll();
    } else {
      return widget._orderProvider.getOrdersPerTable(widget.table!);
    }
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
