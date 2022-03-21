import 'package:beerbox/model/item_type.dart';

final String table = 'item';

class ItemFields {
  static final List<String> values = [
    id, name, costs, itemType
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String costs = 'costs';
  static final String itemType = 'itemTypeId';
}

class Item {

  final int? id;
  final String name;
  final double costs;
  final int itemTypeId;

  const Item({
    this.id,
    required this.name,
    required this.costs,
    required this.itemTypeId});

  static Item fromJson(Map<String, Object?> json) => Item(
      id: json[ItemFields.id] as int?,
      name: json[ItemFields.name] as String,
      costs: json[ItemFields.costs] as double,
      itemTypeId: json[ItemFields.itemType] as int);

  Map<String, Object?> toJson() => {
    ItemFields.id: id,
    ItemFields.name: name,
    ItemFields.costs: costs,
    ItemFields.itemType: itemTypeId,
  };

  Item copy({int? id, String? name, double? costs, int? itemTypeId}) => Item(
      id: id ?? this.id,
      name: name ?? this.name,
      costs: costs ?? this.costs,
      itemTypeId: itemTypeId ?? this.itemTypeId
  );
}