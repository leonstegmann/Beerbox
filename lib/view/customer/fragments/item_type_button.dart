import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';

//import 'dart:ui';
//var screensize = window.physicalSize;

class TypeButton extends StatelessWidget {
  final ItemType _type;

  const TypeButton(this._type); //Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: Colors.grey[400], //Color for Debug
          child: InkWell(
            splashColor: Colors.cyan,
            hoverColor: Colors.teal,
            onTap: () {
              print('pressed');

              },
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(width: 10,),
              Icon(Icons.cake, size: 40),
              Text(_type.toString().split('.').last,style: TextStyle(fontSize: 20),)
            ]),
          ),
        ),
      ),
    );
  }
}
