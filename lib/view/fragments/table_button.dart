import 'package:beerbox/model/table.dart';
import 'package:beerbox/view/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/view/table_item_screen.dart';

/**
 *  Creates clickable Table Icon with Orders and TableNumber
 */
class TableButton extends StatefulWidget {
  // final is necesarry as it is a Stateless Widget whoch cant change
  final CustomerTable table;

  const TableButton(this.table,);
  @override
  State<TableButton> createState() => _TableButtonState();
}

class _TableButtonState extends State<TableButton> {
 //Constructor
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.grey[850], //Color for Debug
        child: InkWell(
          splashColor: Colors.pink,
          hoverColor: Colors.teal,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrdersScreen(widget.table.id)),//TableOrder(widget.table.id)),
            );
          },
          //=> print('table pressed'),
          //Ink.image(image: AssetImage('assets/table.png')), // Problem mit dieser MEthode: lässt sich nicht dynamisch scalieren
          child: Stack(alignment: AlignmentDirectional.center, children: [
            Image.asset(
              'assets/table.png',
              //color: Colors.grey[100], Color is problematic as it overwrites the Lines
            ),
            Column(
              children: [
                Text(
                  "Orders ",
                ),
                Text(
                  'TableNr: ${widget.table.id}',
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
