import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/filter_switch_tile.dart';
import 'package:meals/enums/filters_enum.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  late bool _glutenFreeFilterSet = false;
  late bool _lactoseFreeFilterSet = false;
  late bool _veganFilterSet = false;
  late bool _vegetarianFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filters.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filters.lactoseFree]!;
    _veganFilterSet = activeFilters[Filters.vegan]!;
    _vegetarianFilterSet = activeFilters[Filters.vegetarian]!;
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
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) return;
          ref.read(filtersProvider.notifier).setFilters({
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
