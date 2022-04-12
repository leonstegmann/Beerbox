import 'package:beerbox/model/table.dart';
///
/// Function needed to convert one Table to a List of Tables with only one Table,
/// as the Function getOrdersFromTables() needs a List of tables as input.
///
List<CustomerTable> table2List(CustomerTable object){
  List<CustomerTable> list = [];
  list.add(object);
  return list;
}