import 'package:flutter/material.dart';
import 'package:beerbox/model/item_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  final ValueSetter<ItemType> activateItemTypeField;

  ///Function to set Type of displayed Items

  const Categories(this.activateItemTypeField, {Key? key}) : super(key: key);

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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            mainAxisExtent: 50,
          ),
          itemBuilder: (context, index) =>
              buildCategoryButton(index, widget.activateItemTypeField),
        ),
      ),
    );
  }

  Widget buildCategoryButton(int index, activateItemTypeField) {
    ItemType _type = ItemType.values[index];

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: InkWell(
        hoverColor: Theme.of(context).canvasColor,
        highlightColor: Theme.of(context).canvasColor,
        onTap: () {
          activateItemTypeField(_type);
          selectedIndex = index;
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CategoryButtonContent(
              selectedIndex == index,
              SvgPicture.asset(
                'assets/categoryicons/icon_${_type.name}.svg',
                height: 45,
              ),
              _type.toString().split('.').last),
        ),
      ),
    );
  }
}

class CategoryButtonContent extends StatelessWidget {
  final bool _highlighted;
  final SvgPicture _categoryIcon;
  final String _text;

  const CategoryButtonContent(this._highlighted, this._categoryIcon, this._text,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _color = getColorToUse(Theme.of(context));
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: _categoryIcon,
        ),
        const SizedBox(width: 8),
        Text(_text, style: TextStyle(fontSize: 20, color: _color)),
      ],
    );
  }

  Color getColorToUse(ThemeData themeData) =>
      _highlighted ? themeData.highlightColor : themeData.disabledColor;
}
