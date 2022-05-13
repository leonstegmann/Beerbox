import 'package:beerbox/model/table.dart';
import 'package:beerbox/staff/view/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/control/get_orders_from_tables.dart';
import 'package:beerbox/control/test_data.dart';

///
/// Creates clickable Table Icon with Orders and TableNumber
///
class TableButton extends StatefulWidget {
  // final is necesarry as it is a Stateless Widget which cant change
  final CustomerTable table;

  const TableButton(this.table,{Key? key}): super(key: key);

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
          color: Colors.grey[850], //Color for Debug
          child: InkWell(
            splashColor: Colors.pink,
            hoverColor: Colors.teal,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrdersScreen(getOrdersFromTables( [widget.table]))
                ),
              );
            },
            child: Stack(alignment: AlignmentDirectional.center, children: [ //Methode Ink.image()) lässt sich nicht skalieren
              Image.asset(
                'assets/table.png',
                //color: Colors.grey[100], Color is problematic as it overwrites the Lines
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Orders:   ',
                        style: TextStyle(fontSize: 10),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(400),
                        color: Colors.orange,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Text(
                            ' ${tables[widget.table.id].orders.length}',
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
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
