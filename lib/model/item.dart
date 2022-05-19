import 'package:beerbox/model/db_object.dart';
import 'package:beerbox/model/item_type.dart';

class Item extends DbObject<Item> {

  String name;
  double costs;
  ItemType itemType;

  Item(int? id, this.name, this.costs, this.itemType) : super(id);

  Item.reference(int id)
      : name = "",
        costs = 0.0,
        itemType = ItemType.beer,
        super(id);

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

  static bool jsonContainsItem(Map<String, dynamic> json) {
    return json["item_id"] != null;
  }
}