import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/db_object.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/model/table.dart';
import 'package:beerbox/utils/format_time_to_string.dart';
import 'package:beerbox/utils/string_utils.dart';

class Order extends DbObject<Order> {

  final int outputLength = 30;
  final int outputIndentation = 7;

  DateTime timestamp;
  Customer customer;
  CustomerTable table;
  List<Item> items;

  Order(int id, this.timestamp, this.customer, this.table, this.items) : super(id);

  Order.create(this.customer, this.table, this.items)
      : timestamp = DateTime(0),
        super(null);

  Order.forReferencing(int customerId, int tableId, List<int> itemIds)
      : timestamp = DateTime(0),
        customer = Customer.reference(customerId),
        table = CustomerTable.reference(tableId),
        items = createItemReferenceList(itemIds),
        super(null);

  @override
  factory Order.fromJson(Map<String, dynamic> json) => Order(
      json["order_id"] as int,
      json["timestamp"] as DateTime,
      Customer.fromJson(json),
      CustomerTable.fromJson(json),
      []);

  @override
  Map<String, dynamic> toJsonMap() => {
    'order_id': id,
    'customer_id': "'${customer.id}'",
    'table_id': "'${table.id}'",
  };

  double getFullCosts() {

    double fullCosts = 0;
    for(Item item in items) {
      fullCosts += item.costs;
    }

    return fullCosts;
  }

  String formattedRepresentation() {

    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln("--- Order $id ------------------");
    stringBuffer.writeln("time: ${dateTime2TimeString(timestamp)}");
    stringBuffer.writeln("from: ${customer.firstName} ${customer.familyName}");
    writeItemsToStringBuffer(stringBuffer);
    stringBuffer.writeln("costs: ${getOrderCosts()} NOK");
    stringBuffer.writeln();

    return stringBuffer.toString();
  }

  double getOrderCosts() {

    double costs = 0;
    for (Item item in items) {
      costs += item.costs;
    }

    return costs;
  }

  void writeItemsToStringBuffer(StringBuffer stringBuffer) {

    stringBuffer.writeln("item:");
    for (MapEntry<ItemType, Map<Item, int>> itemEntry in mapItemsByTypeAndCount().entries) {
      if (itemEntry.value.isEmpty) continue;

      for (MapEntry<Item, int> itemWithCount in itemEntry.value.entries) {

        if (itemWithCount.value > 1) {
          writeSpacesToStringBuffer(stringBuffer, (outputIndentation - 2) - itemWithCount.value.toString().length);
          stringBuffer.write("${itemWithCount.value}x ");
        } else {
          writeSpacesToStringBuffer(stringBuffer, outputIndentation);
        }

        String itemName = itemWithCount.key.name;
        String costs = itemWithCount.key.costs.toString() + " NOK";
        int spaces = outputLength - outputIndentation - itemName.length - costs.length;

        stringBuffer.write(itemName);
        writeSpacesToStringBuffer(stringBuffer, spaces);
        stringBuffer.writeln(costs);
      }

      stringBuffer.writeln();
    }
  }

  Map<ItemType, Map<Item, int>> mapItemsByTypeAndCount() {

    Map<ItemType, Map<Item, int>> itemMap = {};
    for (ItemType itemType in ItemType.values) {
      itemMap[itemType] = <Item, int>{};
    }

    for (Item item in items) {
      Map<Item, int> itemWithCount = itemMap[item.itemType]!;
      itemWithCount.putIfAbsent(item, () => 0);
      itemWithCount[item] = itemWithCount[item]!.toInt() + 1;
    }

    return itemMap;
  }

  static List<Item> createItemReferenceList(List<int> ids) {
    List<Item> items = [];
    for (int id in ids) {
      items.add(Item.reference(id));
    }

    return items;
  }
}