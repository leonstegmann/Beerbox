import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';

///
///  Test Set of Tables with Orders for Display
///
final List<CustomerTable> tables = [
  CustomerTable(0, [Order(0, DateTime.now(), Customer(0, "Olaf"), [Item(0, "Pils", 7.2, ItemType.beer)])]),
  CustomerTable(1, [
    Order(1, DateTime.now(), Customer(0, "Thomas"), [
      Item(0, 'Pils', 8.2, ItemType.beer),
      Item(0, 'Pils', 8.2, ItemType.beer),
    ]),
    Order(2, DateTime.now(), Customer(0, "Thomas"), [
      Item(0, 'Radler', 8.2, ItemType.beer)
    ]),Order(3, DateTime.now(), Customer(0, "Thomas"), [
      Item(0, 'Cider', 8.2, ItemType.beer)
    ]),
  ]),
  CustomerTable(2, [Order(4, DateTime.now(), Customer(0, "Sindre"), [
    Item(0, 'Grimstad Whisky', 9.2, ItemType.cocktail)
  ]),]),
  CustomerTable(3, [ Order(5, DateTime.now(), Customer(0, "Hannes"), [
    Item(0, 'Cider', 5.2, ItemType.beer)
  ]),]),
  CustomerTable(4, []),
  CustomerTable(5, []),
  CustomerTable(6, []),
  CustomerTable(7, []),
  CustomerTable(8, []),
  CustomerTable(9, []),
  CustomerTable(10, []),
  CustomerTable(11, []),
  CustomerTable(12, []),
];

///
///  Test Functions
///
void addTestOrders(int i) {
  tables[i].orders.add(
    Order(4, DateTime.now(), Customer(0, "Sindre"), [
      Item(0, 'Grimstad Whisky', 9.2, ItemType.cocktail)
    ]),
  );
}
