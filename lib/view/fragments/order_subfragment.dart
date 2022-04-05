import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/testing/test_data.dart';

class OrderSubFragment extends StatelessWidget {
  final int _orderNumber;
  final int _tableNumber;

  const OrderSubFragment(this._tableNumber, this._orderNumber, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.teal,
          height: tables[_tableNumber].orders[_orderNumber].items.length * 17,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tables[_tableNumber].orders[_orderNumber].items.length,
            itemBuilder: (context, Itemindex) {
              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(),
                    margin: EdgeInsets.only(left: 40, right: 5),
                    color: Colors.blueGrey[320],
                    child: Row(children: [
                      Flexible(
                          child: Center(
                              child: Text(''))),
                      Flexible(
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(tables[_tableNumber]
                                    .orders[_orderNumber]
                                    .items[Itemindex]
                                    .name),
                                Text(
                                  '   (typ??${tables[_tableNumber].orders[_orderNumber].items[Itemindex].itemTypeId.toString()})',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(tables[_tableNumber]
                                    .orders[_orderNumber]
                                    .items[Itemindex]
                                    .costs
                                    .toString()),
                                Text(
                                  'NOK',
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                          child: Center(
                              child: Text(''))),
                    ]),
                  ),
                  Container(
                    height: 2,
                  )
                ],
              );
            },
          ),
        ),
        Container(
          height: 5,
        )
      ],
    );
  }
}

/*
Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Text('Hello'),
          ],
        ),
        Row(
          children: [
            Text('Oredr $_orderNumber'),
          ],
        ),
        Row(
          children: [
            Text('Bye'),
          ],
        )
      ].map((listedItems) {
        return Card(shape: RoundedRectangleBorder(),
            margin: EdgeInsets.only(left: 20,right: 5),
            color: Colors.blueGrey[320],
            child: listedItems);
      }).toList(),
    );*/
