import 'package:beerbox/model/db_object.dart';
import 'package:beerbox/model/item_type.dart';

class Item extends DbObject<Item> {

  String name;
  double costs;
  ItemType itemType;

  /// Normal Constructor with null as id as the id gets managed by the DB.
  Item(this.name, this.costs, this.itemType) : super(null);

  /// Constructor used by the database in order to provide a replica of a database entity.
  Item._db(int? id, this.name, this.costs, this.itemType) : super(id);

  /// A constructor to hold the id as reference to a database entity.
  Item.reference(int id)
      : name = "",
        costs = 0.0,
        itemType = ItemType.beer,
        super(id);

  @override
  factory Item.fromJson(Map<String, dynamic> json) => Item._db(
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