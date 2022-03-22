import 'package:beerbox/model/table.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/view/table_order_screen.dart';

/**
 *  Creates clickable Table Icon with Orders and TableNumber
 */
class TableButton extends StatelessWidget {
  // final is necesarry as it is a Stateless Widget whoch cant change
  final CustomerTable table;

  const TableButton(this.table,); //Constructor
  // Flutter Constructor: (const) ClassName('this.necesarryParameter'{this.optinalparameter ='defaultvalue,zero if empty'})



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
              MaterialPageRoute(builder: (context) => TableOrder(table.id)),
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
                  'TableNr: ${table.id}',
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
