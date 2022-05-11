import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';

///
///  Test Set of Tables with Orders for Display
///
final List<CustomerTable> tables = [
  CustomerTable(0, [Order(0, DateTime.now(), Customer(0, "Olaf"), [Item(id: 0, name: "Pils", costs: 7.2, itemTypeId: ItemType.beer.index)])]),
  CustomerTable(1, [
    Order(1, DateTime.now(), Customer(0, "Thomas"), [
      Item(id: 0, name: 'Pils', costs: 8.2, itemTypeId: ItemType.beer.index),
      Item(id: 0, name: 'Pils', costs: 8.2, itemTypeId: ItemType.beer.index),
    ]),
    Order(2, DateTime.now(), Customer(0, "Thomas"), [
      Item(id: 0, name: 'Radler', costs: 8.2, itemTypeId: ItemType.beer.index)
    ]),Order(3, DateTime.now(), Customer(0, "Thomas"), [
      Item(id: 0, name: 'Cider', costs: 8.2, itemTypeId: ItemType.beer.index)
    ]),
  ]),
  CustomerTable(2, [Order(4, DateTime.now(), Customer(0, "Sindre"), [
    Item(id: 0, name: 'Grimstad Whisky', costs: 9.2, itemTypeId: ItemType.cocktail.index)
  ]),]),
  CustomerTable(3, [ Order(5, DateTime.now(), Customer(0, "Hannes"), [
    Item(id: 0, name: 'Cider', costs: 5.2, itemTypeId: ItemType.beer.index)
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

final List<Item> items = [
  Item(id: 0, name: 'Grimstad Whisky', costs: 9.2, itemTypeId: ItemType.cocktail.index),
  Item(id: 1, name: 'Pils', costs: 8.2, itemTypeId: ItemType.beer.index),
  Item(id: 2, name: 'Radler', costs: 7.2, itemTypeId: ItemType.beer.index),
  Item(id: 3, name: 'Cider', costs: 5.2, itemTypeId: ItemType.beer.index),
  Item(id: 3, name: 'Fireball', costs: 4.0, itemTypeId: ItemType.shot.index),
];

///
///  Test Functions
///
void addTestOrders(int i) {
  tables[i].orders.add(
    Order(4, DateTime.now(), Customer(0, "Sindre"), [
      Item(
          id: 0,
          name: 'Grimstad Whisky',
          costs: 9.2,
          itemTypeId: ItemType.cocktail.index)
    ]),
  );
}
