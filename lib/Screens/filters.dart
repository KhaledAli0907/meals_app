import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch_tile.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _veganFilterSet = false;
  bool _vegetarianFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) => {
      //     Navigator.of(context).pop(),
      //     if (identifier == 'meals')
      //       {
      //         Navigator.of(
      //           context,
      //         ).push(MaterialPageRoute(builder: (ctx) => const TabsScreen())),
      //       },
      //   },
      // ),
      body: Column(
        children: [
          FilterSwitchTile(
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) =>
                setState(() => _glutenFreeFilterSet = isChecked),
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          FilterSwitchTile(
            value: _lactoseFreeFilterSet,
            onChanged: (isChecked) =>
                setState(() => _lactoseFreeFilterSet = isChecked),
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          FilterSwitchTile(
            value: _veganFilterSet,
            onChanged: (isChecked) =>
                setState(() => _veganFilterSet = isChecked),
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
          FilterSwitchTile(
            value: _vegetarianFilterSet,
            onChanged: (isChecked) =>
                setState(() => _vegetarianFilterSet = isChecked),
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
        ],
      ),
    );
  }
}
