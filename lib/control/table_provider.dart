import 'package:beerbox/control/data_provider.dart';
import 'package:beerbox/model/table.dart';

class TableProvider extends DataProvider<CustomerTable> {

  TableProvider () : super('table');

  @override
  Future<CustomerTable> create(CustomerTable dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.create(tableName, dbObject);
    return CustomerTable.fromJson(response.first[tableName]!);
  }

  @override
  Future<CustomerTable> read(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.read(tableName, id);
    return CustomerTable.fromJson(response.first[tableName]!);
  }

  @override
  Future<List<CustomerTable>> readAll() async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.readAll(tableName);

    List<CustomerTable> tables = [];
    for (Map<String, Map<String, dynamic>> customerResponse in response) {
      tables.add(CustomerTable.fromJson(customerResponse[tableName]!));
    }
    return tables;
  }

  @override
  Future<CustomerTable> update(CustomerTable dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.update(tableName, dbObject);
    return CustomerTable.fromJson(response.first[tableName]!);
  }

  @override
  Future<CustomerTable> delete(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.delete(tableName, id);
    return CustomerTable.fromJson(response.first[tableName]!);
  }
}