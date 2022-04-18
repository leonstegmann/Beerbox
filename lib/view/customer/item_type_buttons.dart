import 'package:beerbox/view/customer/fragments/item_type_button.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';

class ItemTypeButtons extends StatelessWidget {
  const ItemTypeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.blue, //Test Color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            TypeButton(ItemType.values[0]),
            Container(height: 10,),
            TypeButton(ItemType.values[1]),
          ]),
          Container(width: 10,),
          Column(children: [
            TypeButton(ItemType.values[2]),
            Container(height: 10,),
            TypeButton(ItemType.values[3]),
          ]),
        ],
      ),
    );
  }
}
