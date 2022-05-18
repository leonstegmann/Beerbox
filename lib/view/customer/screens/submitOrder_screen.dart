import 'package:flutter/material.dart';

class SubmitOrder extends StatelessWidget {
  final int _itemCount;
  final double _totalCost;

  const SubmitOrder(this._totalCost, this._itemCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Order')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Submit Order', style: TextStyle(fontSize: 25)),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Enter Name'),
                  const Text('choose Table'),
                  Text('Items:  ${_itemCount}x'),
                  Text('Total Cost:  $_totalCost  NOK'),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton.extended(
          label: const Text('submit'),
          onPressed: () {},
          backgroundColor: Theme.of(context).hintColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
