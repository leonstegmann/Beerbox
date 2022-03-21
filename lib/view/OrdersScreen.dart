import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
        ),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.grey[100]),
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          color: Colors.grey[850],
          child: Column(
            children: [
              Container(
                color: Colors.grey[800],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Expanded(child: Text('Id')),
                    // Expanded(child: Text('Table')),
                    // Expanded(child: Text('Items')),
                    // Expanded(child: Text('Costs')),
                    // Expanded(child: Text('Time')),
                    Text('Id'),
                    Text('Table'),
                    Text('Items'),
                    Text('Costs'),
                    Text('Time'),
                    IconButton(
                      onPressed: () {
                        print('printed');
                      },
                      icon: Icon(
                        Icons.print,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.blueGrey.shade800,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('1'),
                    Text('5'),
                    Text('3'),
                    Row(
                      children: [
                        Text('480'),
                        Text(
                          'NOK',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Text('20:21'),
                    Text(''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
