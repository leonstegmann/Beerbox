import 'test_data.dart';
import 'package:beerbox/model/customer.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/model/order.dart';
import 'package:beerbox/model/table.dart';


void add_test_orders(int i){
 tables[i].orders.add(Order(4, DateTime.now(), Customer(0, "Sindre"), [
   Item(id: 0, name: 'Grimstad Whisky', costs: 9.2, itemTypeId: ItemType.cocktail.index)
 ]),);

}


