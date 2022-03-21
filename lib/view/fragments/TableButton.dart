import 'package:flutter/material.dart';
import 'package:beerbox/view/TableOrderScreen.dart';

class TableButton extends StatelessWidget {
  final int
      tablenumber; // final is necesarry as it is a Stateless Widget whoch cant change
  const TableButton(
    this.tablenumber,
  ); //Constructor
  // Flutter Constructor: (const) ClassName('this.necesarryParameter'{this.optinalparameter ='defaultvalue,zero if empty'})

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.grey[700], //Color for Debug
        child: InkWell(
          splashColor: Colors.pink,
          hoverColor: Colors.teal,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TableOrder(tablenumber)),
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
                  'TableNr: $tablenumber',
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
