import 'package:flutter/material.dart';

class TableOverview extends StatelessWidget {
  const TableOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TableOverview',
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Icon(Icons.backpack),
          Icon(Icons.backpack),
          Icon(Icons.backpack),
        ],
      ),
    );
  }
}
