import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/filter_switch_tile.dart';
import 'package:meals/enums/filters_enum.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
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
            value: activeFilters[Filters.glutenFree]!,
            onChanged: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.glutenFree, isChecked),
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          FilterSwitchTile(
            value: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.lactoseFree, isChecked),
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          FilterSwitchTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.vegan, isChecked),
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
          FilterSwitchTile(
            value: activeFilters[Filters.vegetarian]!,
            onChanged: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.vegetarian, isChecked),
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
        ],
      ),
    );
  }
}
