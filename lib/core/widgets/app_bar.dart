import 'package:flutter/material.dart';
import 'package:local_brand/core/utils/responsive.dart';

class KayanAppBar extends StatelessWidget {
  const KayanAppBar({
    super.key,
    required this.textTheme,
    this.onPressedPerson,
    this.onPressedCart,
  });

  final TextTheme textTheme;
  final VoidCallback? onPressedPerson;
  final VoidCallback? onPressedCart;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: context.isDesktop
          ? null
          : IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, size: 25),
            ),
      centerTitle: true,
      title: Text('KAYAN', style: textTheme.headlineLarge),
      actions: [
        IconButton(
          onPressed: onPressedCart,
          icon: const Icon(Icons.shopping_bag_outlined, size: 25),
        ),
        IconButton(
          onPressed: onPressedPerson,
          icon: const Icon(Icons.person_2_outlined, size: 25),
        ),
      ],
    );
  }
}
