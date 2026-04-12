import 'package:flutter/material.dart';
import 'package:meals/Models/meal.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/screens/categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final wasFavorite = favoriteMeals.contains(meal);
    setState(() {
      wasFavorite ? favoriteMeals.remove(meal) : favoriteMeals.add(meal);
    });
    _showInfoMessage(
      wasFavorite ? 'Removed from favorites' : 'Added to favorites',
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const Center(child: Text('Tabs'));
    String activePageTitle = 'Tabs';

    switch (_selectedPageIndex) {
      case 1:
        activePage = MealsScreen(
          title: 'Favorites',
          meals: favoriteMeals,
          onToggleFavorite: _toggleMealFavoriteStatus,
        );
        activePageTitle = 'Favorites';
        break;
      case 0:
        activePage = CategoriesScreen(
          onToggleFavorite: _toggleMealFavoriteStatus,
        );
        activePageTitle = 'Categories';
        break;
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
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
