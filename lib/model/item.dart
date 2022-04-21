import 'package:beerbox/model/db_object.dart';
import 'package:beerbox/model/item_type.dart';

class Item extends DbObject {

  final String name;
  final double costs;
  final ItemType itemType;

  Item(int? id, this.name, this.costs, this.itemType) : super(id);

  factory Item.fromJson(Map<String, Object?> json) => Item(
      json["_id"] as int,
      json["name"] as String,
      json["costs"] as double,
      ItemType.values[json["itemType_id"] as int]);

  @override
  Map<String, dynamic> toJsonMap() => {
    '_id': id,
    'name': "'$name'",
    'costs': "'$name'",
    'itemType_id': "'${itemType.index}'",
  };
}