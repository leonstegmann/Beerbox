import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';

class Categories extends StatefulWidget {

  final ValueSetter<ItemType> activateItemTypeField; ///Function to set Type of displayed Items

  const Categories(this.activateItemTypeField,{Key? key,}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SizedBox(
        height: 120,
        child: GridView.builder(
          itemCount: ItemType.values.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10.0,crossAxisSpacing: 10.0,mainAxisExtent: 50,),
          itemBuilder: (context, index) =>
              buildCategoryButton(index,widget.activateItemTypeField),
        ),
      ),
    );
  }

  Widget buildCategoryButton(int index,activateItemTypeField) {
    ItemType _type = ItemType.values[index];
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.secondary,
      ),
      child: InkWell(
        splashColor: Colors.cyan,
        onTap: () {
          activateItemTypeField(_type);
          selectedIndex = index;
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: selectedIndex == index ? [
            Icon(Icons.cake, size: 40, color: Theme.of(context).highlightColor),
            Text(_type.toString().split('.').last, style: TextStyle(fontSize: 20, color: Theme.of(context).highlightColor),),
          ] : [
            Icon(Icons.cake, size: 40, color: Theme.of(context).disabledColor),
            Text(_type.toString().split('.').last, style: TextStyle(fontSize: 20, color: Theme.of(context).disabledColor),
            ),
          ]),
        ),
      ),
    );
  }
}
