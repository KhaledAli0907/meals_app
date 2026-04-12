import 'package:flutter/material.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/screens/categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

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
        activePage = const MealsScreen(title: 'Favorites', meals: []);
        activePageTitle = 'Favorites';
        break;
      case 0:
        activePage = const CategoriesScreen();
        activePageTitle = 'Categories';
        break;
    }
    return Scaffold(
      appBar: AppBar(title: Text('Tabs')),
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
