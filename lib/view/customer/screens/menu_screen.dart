import 'package:beerbox/model/basket.dart';
import 'package:beerbox/view/customer/screens/basket_screen.dart';
import 'package:beerbox/view/customer/screens/fragments/menu_items.dart';
import 'package:beerbox/view/customer/screens/fragments/menu_navigation.dart';
import 'package:beerbox/view/customer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:beerbox/model/item.dart';
import 'package:beerbox/control/item_provider.dart';

/// Loads MenuList for all following widgets.
/// Organises as subWidgets the ItemTypeButtons and the ItemList
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
  void initState() {
    super.initState();
    itemsFuture = getOrders();
  }

  Future<List<Item>> getOrders() async {
    List<Item> result = await widget.itemProvider.readAll();
    return result;
  }

  void activateItemTypeField(ItemType newType) {
    setState(() {
      loadedItemType = newType;
    });
  }

  // void refresh(){
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 5),
                  Categories(activateItemTypeField),
                ],
              ),
            ),
            const SizedBox(height: 10),
            buildItemList(),
          ],
        ),
      ),
    );
  }

  Expanded buildItemList() {
    return Expanded(
      child: FutureBuilder(
        future: itemsFuture,
        builder: (context, AsyncSnapshot<List<Item>> snapshotItems) {
          if (snapshotItems.hasError) {
            final error = snapshotItems.error;
            return Text('$error');
          } else if (snapshotItems.connectionState == ConnectionState.done &&
              snapshotItems.data != null) {
            List<List<Item>> loadedItemList = [
              snapshotItems.data!
                  .where((i) => i.itemType == ItemType.beer)
                  .toList(),
              snapshotItems.data!
                  .where((i) => i.itemType == ItemType.cocktail)
                  .toList(),
              snapshotItems.data!
                  .where((i) => i.itemType == ItemType.shot)
                  .toList(),
              snapshotItems.data!
                  .where((i) => i.itemType == ItemType.snack)
                  .toList(),
            ];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (loadedItemType == ItemType.values[0])
                  ItemDisplay(setState, loadedItemList[0], loadedItemType),
                if (loadedItemType == ItemType.values[1])
                  ItemDisplay(setState, loadedItemList[1], loadedItemType),
                if (loadedItemType == ItemType.values[2])
                  ItemDisplay(setState, loadedItemList[2], loadedItemType),
                if (loadedItemType == ItemType.values[3])
                  ItemDisplay(setState, loadedItemList[3], loadedItemType),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

AppBar buildAppBar(context) {
  int _itemAmount = Basket.instance.itemCounter();
  return AppBar(
    title: const Text('Menu'),
    leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            )),
    actions: [
      InkWell(
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)))),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartWidget()),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 40,
                ),
                Text(' ${_itemAmount}',
                    style: TextStyle(
                        fontSize: 16,
                        color: _itemAmount == 0
                            ? Theme.of(context).primaryColor
                            : Colors.red,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(width: 50),
    ],
  );
}
