import 'package:beerbox/controll/data_provider.dart';
import 'package:beerbox/model/customer.dart';

class CustomerProvider extends DataProvider<Customer> {

  CustomerProvider () : super('customer');

  @override
  Future<Customer> create(Customer dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.create(tableName, dbObject);
    return Customer.fromJson(response.first[tableName]!);
  }

  @override
  Future<Customer> read(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.read(tableName, id);
    return Customer.fromJson(response.first[tableName]!);
  }

  @override
  Future<List<Customer>> readAll() async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.readAll(tableName);

    List<Customer> customers = [];
    for (Map<String, Map<String, dynamic>> customerResponse in response) {
      customers.add(Customer.fromJson(customerResponse[tableName]!));
    }
    return customers;
  }

  @override
  Future<Customer> update(Customer dbObject) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.update(tableName, dbObject);
    return Customer.fromJson(response.first[tableName]!);
  }

  @override
  Future<Customer> delete(int id) async {
    List<Map<String, Map<String, dynamic>>> response = await dbCrud.delete(tableName, id);
    return Customer.fromJson(response.first[tableName]!);
  }
}