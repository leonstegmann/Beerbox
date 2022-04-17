import 'package:beerbox/view/customer_view/fragments/item_type_button.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';

class ItemTypeButtons extends StatelessWidget {
  const ItemTypeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, //Test Color
      child: Table(
        children: [
          TableRow(children: [
            TypeButton(ItemType.values[0]),
            TypeButton(ItemType.values[1])
          ]),
          TableRow(children: [
            TypeButton(ItemType.values[2]),
            TypeButton(ItemType.values[3])
          ]),
        ],
      ),
    );
  }
}
