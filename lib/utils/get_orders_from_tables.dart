import 'package:tuple/tuple.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';

///
/// Function needed to gather all Orders from a List of Tables with the associated Tablenumber to pass
/// it to the Orderscreen in form of a List of Tuples
///
List<Tuple2<Order, int>> getOrdersFromTables(List<CustomerTable> tableList) {
  List<Tuple2<Order, int>> orderList =  [];
  for(int table_i = 0; table_i < tableList.length; table_i++) {
    for (int order_i = 0; order_i < tableList[table_i].orders.length; order_i++) {
      orderList.add(Tuple2<Order, int>( tableList[table_i].orders[order_i], tableList[table_i].id ));
    }
  }
  return orderList;
}
