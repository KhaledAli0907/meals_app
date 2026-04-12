import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch_tile.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _glutenFreeFilterSet = false;
  late bool _lactoseFreeFilterSet = false;
  late bool _veganFilterSet = false;
  late bool _vegetarianFilterSet = false;

  @override
  void initState() {
    super.initState();
    final f = widget.currentFilters;
    _glutenFreeFilterSet = f[Filters.glutenFree] ?? false;
    _lactoseFreeFilterSet = f[Filters.lactoseFree] ?? false;
    _veganFilterSet = f[Filters.vegan] ?? false;
    _vegetarianFilterSet = f[Filters.vegetarian] ?? false;
  }

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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenFreeFilterSet,
            Filters.lactoseFree: _lactoseFreeFilterSet,
            Filters.vegetarian: _vegetarianFilterSet,
            Filters.vegan: _veganFilterSet,
          });
        },
        child: Column(
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
      ),
    );
  }
}
