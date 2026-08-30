import 'package:flutter/material.dart';

class KayanAppBar extends StatelessWidget {
  const KayanAppBar({super.key, required this.textTheme, this.onPressedPerson});

  final TextTheme textTheme;
  final VoidCallback? onPressedPerson;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(Icons.menu, size: 25),
      ),
      centerTitle: true,
      title: Text('KAYAN', style: textTheme.headlineLarge),
      actions: [
        const Icon(Icons.shopping_bag_outlined, size: 25),
        IconButton(
          onPressed: onPressedPerson,
          icon: const Icon(Icons.person_2_outlined, size: 25)),
      ],
    );
  }
}
