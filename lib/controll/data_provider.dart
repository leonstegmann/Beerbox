import 'package:beerbox/controll/db_crud.dart';

abstract class DataProvider<T> {

  DbCrud dbCrud = DbCrud.instance;
  late String tableName;

  DataProvider(this.tableName);

  Future<T> create(T dbObject);
  Future<T> read(int id);
  Future<List<T>> readAll();
  Future<T> update(T dbObject);
  Future<T> delete(int id);
}