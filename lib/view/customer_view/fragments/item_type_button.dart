import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';


class TypeButton extends StatelessWidget {
  final ItemType _type;

  const TypeButton(this._type); //Constructor

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
            print('pressed');
          },
          child: Row(
              children: [Icon(Icons.cake), Text(_type.toString())]),
        ),
      ),
    );
  }
}
