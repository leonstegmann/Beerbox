import 'package:flutter/material.dart';

class TableButton extends StatelessWidget {

  final int tablenumber; // final is necesarry as it is a Stateless Widget whoch cant change
  const TableButton(this.tablenumber, ); //Constructor
  // Flutter Constructor: (const) ClassName('this.necesarryParameter'{this.optinalparameter ='defaultvalue,zero if empty'})

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        //color: Colors.green[200], //Color for Debug
      child: InkWell(
        splashColor: Colors.black26,
        onTap: () => print('table pressed'),
        //Ink.image(image: AssetImage('assets/table.png')), // Problem mit dieser MEthode: lässt sich nicht dynamisch scalieren
        child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset('assets/table.png',),
            Column(
              children: [
                Text("Orders ", ),
                Text('TableNr: $tablenumber',style: TextStyle(fontSize: 10),)],
            )
          ]),
      ),
      ),
    );
  }
}
