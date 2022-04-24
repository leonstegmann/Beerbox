import 'package:beerbox/controll/data_provider.dart';
import 'package:beerbox/model/item.dart';

class ItemProvider extends DataProvider<Item> {

  ItemProvider () : super('item');

  @override
  Future<Item> create(Item dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.create(tableName, dbObject);
    return Item.fromJson(response.first[tableName]!);
  }

  @override
  Future<Item> read(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.read(tableName, id);
    return Item.fromJson(response.first[tableName]!);
  }

  @override
  Future<List<Item>> readAll() async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.readAll(tableName);

    List<Item> items = [];
    for (Map<String, Map<String, dynamic>> itemResponse in response) {
      items.add(Item.fromJson(itemResponse[tableName]!));
    }
    return items;
  }

  @override
  Future<Item> update(Item dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.update(tableName, dbObject);
    return Item.fromJson(response.first[tableName]!);
  }

  @override
  Future<Item> delete(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.delete(tableName, id);
    return Item.fromJson(response.first[tableName]!);
  }
}