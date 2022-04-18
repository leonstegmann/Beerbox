import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/view/staff/fragments/order_fragment.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<CustomerTable> tables = [CustomerTable(4, [Order(1, DateTime.now(), Customer(0, "Olaf"), [Item(id: 0, name: "Pils", costs: 7.2, itemTypeId: ItemType.beer.index)])])];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
        ),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.grey[100]),
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          color: Colors.grey[850],
          child: Column(
            children: [
              Container(
                child: DefaultTextStyle(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Flexible(
                        child: Text('ID'),
                        flex: 1,
                      ),
                      Flexible(
                        child: Text('TABLE'),
                        flex: 1,
                      ),
                      Flexible(
                        child: Text('ITEMS'),
                        flex: 1,
                      ),
                      Flexible(
                        child: Text('COSTS'),
                        flex: 3,
                      ),
                      Flexible(
                        child: Text('TIMESTAMP'),
                        flex: 3,
                      ),
                      Flexible(
                        child: Text(''),
                        flex: 1,
                      ),
                    ],
                  ),
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Column(
                  children: tables.first.orders.map((order) => OrderFragment(5, order)).toList(),
              ),
            ],
          ),
          // child: Table(
          //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          //   children: [
          //     TableRow(
          //       children: [
          //         TableCell(child: Text('ID')),
          //         TableCell(child: Text('TABLE')),
          //         TableCell(child: Text('ITEMS')),
          //         TableCell(child: Text('COSTS')),
          //         TableCell(child: Text('TIMESTAMP')),
          //         TableCell(child: Text('')),
          //       ],
          //     ),
          //     TableRow(
          //       children: [
          //         TableCell(child: Text('1')),
          //         TableCell(child: Text('2')),
          //         TableCell(child: Text('3')),
          //         TableCell(child: Text('4.0')),
          //         TableCell(child: Text('12353')),
          //         TableCell(
          //           child: IconButton(
          //             onPressed: () {
          //               print('printed');
          //             },
          //             icon: Icon(
          //               Icons.print,
          //               color: Colors.grey[100],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
