import 'package:flutter/material.dart';

class FilterSwitchTile extends StatelessWidget {
  const FilterSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.subtitle,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge?.copyWith(
      color: theme.colorScheme.onSurface,
    );
    final subtitleStyle = theme.textTheme.labelMedium?.copyWith(
      color: theme.colorScheme.onSurface,
    );

    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title, style: titleStyle),
      subtitle: Text(subtitle, style: subtitleStyle),
    );
  }
}
