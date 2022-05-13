import 'package:beerbox/view/customer/display_of_items.dart';
import 'package:beerbox/view/customer/fragments/categories.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/control/item_provider.dart';

///
/// Loads MenuList for all following widgets.
/// Organises as subWidgets the ItemTypeButtons and the ItemList
///
class Menu extends StatefulWidget {
  final ItemProvider itemProvider = ItemProvider();
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ItemType? loadedItemType;


  late Future<List<Item>> itemsFuture;

  @override
  void initState(){
    super.initState();
    itemsFuture = getOrders();
  }

  Future<List<Item>> getOrders() async {
    List<Item> result = await widget.itemProvider.readAll();
    print(result);
    return result;
  }

  void activateItemTypeField(ItemType newType) {
    setState(() {
      loadedItemType = newType;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
        color: Colors.grey,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Categories(activateItemTypeField),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: FutureBuilder(
                  future: itemsFuture,
                  builder: (context, AsyncSnapshot<List<Item>> snapshotItems){
                      if (snapshotItems.hasError) {
                        final error = snapshotItems.error;
                      return Text('$error');
                      } else if (snapshotItems.connectionState == ConnectionState.done &&
                        snapshotItems.data != null) {
                        List<List<Item>> loadedItemList = [
                          snapshotItems.data!.where((i) => i.itemType == ItemType.beer).toList(),
                          snapshotItems.data!.where((i) => i.itemType == ItemType.cocktail).toList(),
                          snapshotItems.data!.where((i) => i.itemType == ItemType.shot).toList(),
                          snapshotItems.data!.where((i) => i.itemType == ItemType.snack).toList(),
                        ];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (loadedItemType == ItemType.values[0])
                              ItemDisplay(loadedItemList[0], loadedItemType),
                            if (loadedItemType == ItemType.values[1])
                              ItemDisplay(loadedItemList[1], loadedItemType),
                            if (loadedItemType == ItemType.values[2])
                              ItemDisplay(loadedItemList[2], loadedItemType),
                            if (loadedItemType == ItemType.values[3])
                              ItemDisplay(loadedItemList[3], loadedItemType),
                          ],
                        );
 return Text('mmh noice');
                      } else {
                        return const CircularProgressIndicator();
                      }
                                    },
                )),
          ],
        ),
      ),
    );
  }
}
