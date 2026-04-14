import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/enums/filters_enum.dart';

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
    : super({
        Filters.glutenFree: false,
        Filters.lactoseFree: false,
        Filters.vegetarian: false,
        Filters.vegan: false,
      });

  void setFilters(Map<Filters, bool> filters) {
    state = filters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
      (ref) => FiltersNotifier(),
    );
