import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/widgets/main_drawer.dart';

const Map<Filters, bool> kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filters, bool> _activeFilters = kInitialFilters;

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop(); // close the drawer
    if (identifier == 'settings') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _activeFilters),
        ),
      );
      setState(() {
        _activeFilters = result ?? kInitialFilters;
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const Center(child: Text('Tabs'));
    final availableMeals = dummyMeals
        .where(
          (meal) =>
              (_activeFilters[Filters.glutenFree] == true
                  ? meal.isGlutenFree
                  : true) &&
              (_activeFilters[Filters.lactoseFree] == true
                  ? meal.isLactoseFree
                  : true) &&
              (_activeFilters[Filters.vegetarian] == true
                  ? meal.isVegetarian
                  : true) &&
              (_activeFilters[Filters.vegan] == true ? meal.isVegan : true),
        )
        .toList();

    String activePageTitle = 'Tabs';

    final favoriteMeals = ref.watch(favoriteMealsProvider);
    switch (_selectedPageIndex) {
      case 1:
        activePage = MealsScreen(
          title: 'Favorites',
          meals: favoriteMeals,
        );
        activePageTitle = 'Favorites';
        break;
      case 0:
        activePage = CategoriesScreen(
          availableMeals: availableMeals,
        );
        activePageTitle = 'Categories';
        break;
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
