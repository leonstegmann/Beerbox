import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/utils/string_utils.dart';

class Order {

  final int outputLength = 30;
  final int outputIndentation = 7;

  final int _id;
  final DateTime _timestamp;
  final Customer _customer;
  final List<Item> _items;

  Order(this._id, this._timestamp, this._customer, this._items);

  double getFullCosts() {

    double fullCosts = 0;
    for(Item item in _items) {
      fullCosts += item.costs;
    }

    return fullCosts;
  }

  String formattedRepresentation() {

    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln("--- Order $id ---");
    stringBuffer.writeln("time: $_timestamp");
    stringBuffer.writeln("from: ${_customer.name}");
    writeItemsToStringBuffer(stringBuffer);
    stringBuffer.writeln("costs: ${getOrderCosts()}NOK");

    return stringBuffer.toString();
  }

  double getOrderCosts() {

    double costs = 0;
    for (Item item in _items) {
      costs += item.costs;
    }

    return costs;
  }

  void writeItemsToStringBuffer(StringBuffer stringBuffer) {

    stringBuffer.writeln("item:");
    for (MapEntry<int, Map<Item, int>> itemEntry in mapItemsByTypeAndCount().entries) {
      for (MapEntry<Item, int> itemWithCount in itemEntry.value.entries) {

        if (itemWithCount.value > 1) {
          writeSpacesToStringBuffer(stringBuffer, (outputIndentation - 2) - itemWithCount.value.toString().length);
          stringBuffer.write("${itemWithCount.value}x ");
        } else {
          writeSpacesToStringBuffer(stringBuffer, outputIndentation);
        }

        String itemName = itemWithCount.key.name;
        stringBuffer.write(itemName);
        writeSpacesToStringBuffer(stringBuffer, (outputLength - outputIndentation) - itemName.length);
        stringBuffer.writeln(itemWithCount.key.costs);
      }

      stringBuffer.writeln();
    }
  }

  Map<int, Map<Item, int>> mapItemsByTypeAndCount() {

    Map<int, Map<Item, int>> itemMap = {};
    for (ItemType itemType in ItemType.values) {
      itemMap[itemType.index] = <Item, int>{};
    }

    for (Item item in _items) {
      Map<Item, int> itemWithCount = itemMap[item.itemTypeId]!;
      itemWithCount.putIfAbsent(item, () => 0);
      itemWithCount[item] = itemWithCount[item]!.toInt() + 1;
    }

    return itemMap;
  }

  int get id => _id;
  DateTime get timestamp => _timestamp;
  Customer get customer => _customer;
  List<Item> get items => _items;
}