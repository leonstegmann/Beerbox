import 'package:flutter/material.dart';
import 'package:beerbox/testing/test_data.dart';

class OrderSubFragment extends StatelessWidget {
  final int _orderNumber;
  final int _tableNumber;

  const OrderSubFragment(this._tableNumber, this._orderNumber, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: tables[_tableNumber].orders[_orderNumber].items.length * 17,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tables[_tableNumber].orders[_orderNumber].items.length,
            itemBuilder: (context, itemIndex) {
              return Column(
                children: [
                  Card(
                    margin: const EdgeInsets.only(left: 40, right: 5),
                    color: Colors.grey[200],
                    child: Row(children: [
                      const Flexible(
                        flex: 2,
                          child: Center(
                              child: Text(''))),
                      Flexible(
                        flex: 3,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(tables[_tableNumber].orders[_orderNumber].items[itemIndex].name),
                              Text(
                                '   (typ??${tables[_tableNumber].orders[_orderNumber].items[itemIndex].itemTypeId.toString()})',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(tables[_tableNumber].orders[_orderNumber].items[itemIndex].costs.toString()),
                              const Text(
                                'NOK',
                                style: TextStyle(fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                      const Flexible(
                        flex: 4,
                          child: Center(
                              child: Text(''))),
                    ]),
                  ),
                  const SizedBox(height: 2,)
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 5,)
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
