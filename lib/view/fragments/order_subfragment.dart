import 'package:beerbox/model/order.dart';
import 'package:flutter/material.dart';

class OrderSubFragment extends StatelessWidget {
  final Order _order;

  const OrderSubFragment(this._order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: _order.items.length * 17,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _order.items.length,
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
                              Text(_order.items[itemIndex].name),
                              Text(
                                '   (typ??${_order.items[itemIndex].itemTypeId.toString()})',
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
                              Text(_order.items[itemIndex].costs.toString()),
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
