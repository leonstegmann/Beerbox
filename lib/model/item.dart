import 'package:beerbox/model/db_object.dart';
import 'package:beerbox/model/item_type.dart';

class Item extends DbObject<Item> {

  final String name;
  final double costs;
  final ItemType itemType;

  Item(int? id, this.name, this.costs, this.itemType) : super(id);

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      json["item_id"] as int,
      json["name"] as String,
      json["costs"] as double,
      ItemType.values[json["itemtype_id"] as int]);

  @override
  Map<String, dynamic> toJsonMap() => {
    'item_id': id,
    'name': "'$name'",
    'costs': "'$name'",
    'itemType_id': "'${itemType.index}'",
  };

  @override
  String toString() {
    return ' $name      ${itemType.name}       $costs NOK';
  }
}