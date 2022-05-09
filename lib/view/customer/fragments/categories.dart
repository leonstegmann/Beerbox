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
      width: 130,
      height: 50,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[400]),
      child: InkWell(
        splashColor: Colors.cyan,
        onTap: () {
          activateItemTypeField(_type);
          selectedIndex = index;
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(width: 10,),
          Icon(Icons.cake, size: 40, color: selectedIndex == index ? Colors.black : Colors.grey ),
          Text(_type.toString().split('.').last,style: TextStyle(fontSize: 20,color: selectedIndex == index ? Colors.black : Colors.grey),)
        ]),
      ),
    );
  }

}
