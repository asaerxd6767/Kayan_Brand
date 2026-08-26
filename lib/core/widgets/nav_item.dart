import 'package:flutter/material.dart';

class KayanNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const KayanNavItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return IconButton(
      isSelected: isSelected,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: isSelected
            ? colorTheme.primary
            : colorTheme.secondary,
        foregroundColor: isSelected
            ? colorTheme.onPrimary
            : colorTheme.onSecondary,
      ),
      onPressed: onTap,
    );
  }
}
