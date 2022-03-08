import 'package:beerbox/model/item_type.dart';

class Item {

  final String _name;
  final double _costs;
  final ItemType _itemType;

  Item(this._name, this._costs, this._itemType);

  double get costs => _costs;

  String get name => _name;

  ItemType get itemType => _itemType;
}