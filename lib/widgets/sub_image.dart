import 'package:flutter/material.dart';

import '../core/theme/app_radius.dart';

class SubImage extends StatelessWidget {
  const SubImage({super.key});

  @override
  Widget build(BuildContext context) {
        final colorTheme = Theme.of(context).colorScheme;

    return Container(
      height: 150,
      
      decoration: BoxDecoration(
        color: colorTheme.secondaryContainer,
        borderRadius: KayanRadius.borderLg,
      ),
      child: Icon(Icons.add, size: 20),
    );
  }
}
