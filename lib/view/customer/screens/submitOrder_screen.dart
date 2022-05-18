import 'package:beerbox/control/table_provider.dart';
import 'package:beerbox/model/table.dart';
import 'package:flutter/material.dart';

class SubmitOrder extends StatelessWidget {
  final int _itemCount;
  final double _totalCost;
  final TableProvider tableProvider = TableProvider();
  CustomerTable? selectedTable;

  SubmitOrder(this._totalCost, this._itemCount, {Key? key}) : super(key: key);

  Future<List<CustomerTable>> getTables() async {
    List<CustomerTable> result = await tableProvider.readAll();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstnameController = TextEditingController();
    TextEditingController _lastnameController = TextEditingController();
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
                  TextField(
                    controller: _firstnameController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Theme.of(context).hintColor),
                      labelText: 'First name',
                      border: const UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  TextField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Theme.of(context).hintColor),
                      labelText: 'Last name',
                      border: const UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  Row(
                    children: [
                      Text(
                        'Table:  ',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      FutureBuilder(
                        future: getTables(),
                        builder: (context,
                            AsyncSnapshot<List<CustomerTable>> snapshotTables) {
                          if (snapshotTables.hasError) {
                            final error = snapshotTables.error;
                            return Text('$error');
                          } else if (snapshotTables.connectionState ==
                                  ConnectionState.done &&
                              snapshotTables.data != null) {
                            return TablesDropdownButton(
                                snapshotTables.data!, selectedTable);
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Items:  ',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      const SizedBox(width: 10),
                      Text('${_itemCount} x'),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        'Total Cost: ',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      const SizedBox(width: 10),
                      Text('${_totalCost}'),
                      const Text(
                        '  NOK',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
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

class TablesDropdownButton extends StatefulWidget {
  final List<CustomerTable> _tables;
  CustomerTable? _selectedTable;

  TablesDropdownButton(this._tables, this._selectedTable, {Key? key})
      : super(key: key);

  @override
  State<TablesDropdownButton> createState() => _TablesDropdownButtonState();
}

class _TablesDropdownButtonState extends State<TablesDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: widget._tables
          .map((table) => DropdownMenuItem(
                value: table,
                child: Text(table.id.toString()),
              ))
          .toList(),
      onChanged: (CustomerTable? chosenTable) =>
          setState(() => widget._selectedTable = chosenTable),
      value: widget._selectedTable,
      underline: const SizedBox(),
    );
  }
}
