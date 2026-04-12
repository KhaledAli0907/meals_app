import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge?.copyWith(
      color: theme.colorScheme.primary,
    );

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Center(child: Text('Cooking Up!', style: titleStyle)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Meals', style: titleStyle),
            onTap: () => onSelectScreen('meals'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings', style: titleStyle),
            onTap: () => onSelectScreen('settings'),
          ),
        ],
      ),
    );
  }
}
