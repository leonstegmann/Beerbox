import 'package:beerbox/control/table_provider.dart';
import 'package:beerbox/model/table.dart';
import 'package:flutter/material.dart';

class SubmitOrder extends StatefulWidget {
  final int _itemCount;
  final double _totalCost;
  final TableProvider tableProvider = TableProvider();

  SubmitOrder(this._totalCost, this._itemCount, {Key? key}) : super(key: key);

  @override
  State<SubmitOrder> createState() => _SubmitOrderState();
}

class _SubmitOrderState extends State<SubmitOrder> {
  late Future<List<CustomerTable>> _tables;
  CustomerTable? selectedTable;

  @override
  void initState() {
    super.initState();
    _tables = getTables();
  }

  Future<List<CustomerTable>> getTables() async {
    List<CustomerTable> result = await widget.tableProvider.readAll();
  //  setState(() {});
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
                    decoration: const InputDecoration(
                      labelText: 'First name',
                      border: UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  TextField(
                    controller: _lastnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last name',
                      border: UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  const Text('choose Table'),
                  FutureBuilder(
                      future: _tables,
                      builder: (context,
                          AsyncSnapshot<List<CustomerTable>> snapshotTables) {
                        if (snapshotTables.hasError) {
                          final error = snapshotTables.error;
                          return Text('$error');
                        } else if (snapshotTables.connectionState ==
                                ConnectionState.done &&
                            snapshotTables.data != null) {
                          return TablesDropdownButton(
                              snapshotTables.data!, selectedTable, setState);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },),
                  Text('Items:  ${widget._itemCount}x'),
                  Text('Total Cost:  ${widget._totalCost}  NOK'),
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
          onPressed: () {
            print(_firstnameController.text);
          },
          backgroundColor: Theme.of(context).hintColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TablesDropdownButton extends StatelessWidget {
  final List<CustomerTable> _tables;
  CustomerTable? _selectedTable;
  final StateSetter setState;

  TablesDropdownButton(this._tables, this._selectedTable, this.setState,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _tables.map((table) => DropdownMenuItem(
        value: table,
        child: Text(table.id.toString()),
      ),
      ).toList(),
      onChanged: (CustomerTable? value) {
        setState(() {
          _selectedTable = value;
          print(_selectedTable!.id.toString());
        });
      },
      value: _selectedTable,
      underline: const SizedBox(),
    );
  }
}
