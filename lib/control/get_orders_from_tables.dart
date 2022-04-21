import 'package:tuple/tuple.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';

///
/// Function needed to gather all Orders from a List of Tables with the associated Tablenumber to pass
/// it to the Orderscreen in form of a List of Tuples
///
List<Tuple2<Order, int>> getOrdersFromTables(List<CustomerTable> tableList) {
  List<Tuple2<Order, int>> orderList =  [];
  for(CustomerTable table in tableList) {
    for (Order order in table.orders) {
      orderList.add(Tuple2<Order, int>(order, table.id!));
    }
  }
  return orderList;
}
