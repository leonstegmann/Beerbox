import 'package:beerbox/control/customer_provider.dart';
import 'package:beerbox/control/order_provider.dart';
import 'package:beerbox/control/table_provider.dart';
import 'package:beerbox/model/basket.dart';
import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/view/customer/screens/basket_screen.dart';
import 'package:beerbox/view/customer/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SubmitOrder extends StatelessWidget {
  final int _itemCount;
  final double _totalCost;
  final TableProvider tableProvider = TableProvider();
  CustomerTable? selectedTable;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  SubmitOrder(this._totalCost, this._itemCount, {Key? key}) : super(key: key);

  Future<List<CustomerTable>> getTables() async {
    List<CustomerTable> result = await tableProvider.readAll();
    return result;
  }

  void refreshSelectedTable(CustomerTable newTable) {
    selectedTable = newTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Submit Order', style: TextStyle(fontSize: 35)),
            const SizedBox(height: 10),
            TextField(
              controller: _firstnameController,
              maxLength: 32,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                labelText: 'First name',
                border: const UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
            ),
            TextField(
              controller: _lastnameController,
              maxLength: 32,
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
                buildFutureBuilder(),
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
                Text(_totalCost.toString()),
                const Text(
                  '  NOK',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  FutureBuilder<List<CustomerTable>> buildFutureBuilder() {
    return FutureBuilder(
      future: getTables(),
      builder: (context, AsyncSnapshot<List<CustomerTable>> snapshotTables) {
        if (snapshotTables.hasError) {
          final error = snapshotTables.error;
          return Text('$error');
        } else if (snapshotTables.connectionState == ConnectionState.done &&
            snapshotTables.data != null) {
          return TablesDropdownButton(
              snapshotTables.data!, selectedTable, refreshSelectedTable);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton.extended(
        label: Text(
          'submit',
          style: Theme.of(context).textTheme.headline6,
        ),
        onPressed: () {
          if (checkOrderCompleteness(_firstnameController.text,
              _lastnameController.text, selectedTable, context)) {
            processOrder(_firstnameController.text, _lastnameController.text,
                selectedTable!, context);
          }
        },
        backgroundColor: Theme.of(context).hintColor,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Submit Order'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BasketScreen()),
        ),
      ),
    );
  }
}

class TablesDropdownButton extends StatefulWidget {
  final List<CustomerTable> _tables;
  CustomerTable? _selectedTable;
  final ValueSetter<CustomerTable> refreshSelectedTable;

  TablesDropdownButton(
      this._tables, this._selectedTable, this.refreshSelectedTable,
      {Key? key})
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
      onChanged: (CustomerTable? chosenTable) => setState(() {
        widget._selectedTable = chosenTable;
        widget.refreshSelectedTable(chosenTable!);
      }),
      value: widget._selectedTable,
      underline: const SizedBox(),
    );
  }
}

void processOrder(
    String firstName, String familyName, CustomerTable table, context) async {
  Customer _newCustomer =
      await CustomerProvider().create(Customer(firstName, familyName));
  List<Item> _items = Basket.instance.map2List();
  Order _sendingOrder =
      await OrderProvider().create(Order(_newCustomer, table, _items));
  Basket.instance.cleanBasket();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
    (route) => false,
  );

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
          "Your order has been submitted! Ordernumber ${_sendingOrder.id}"),
      duration: const Duration(seconds: 5),
    ),
  );
}

bool checkOrderCompleteness(
    String firstName, String familyName, CustomerTable? table, context) {
  if (firstName.isNotEmpty &&
      familyName.isNotEmpty &&
      table != null &&
      Basket.instance.itemsInCart.isNotEmpty) {
    return true;
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Entries not complete or basket empty, please check again"),
    ));
    return false;
  }
}
