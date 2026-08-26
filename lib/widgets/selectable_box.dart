import 'package:flutter/material.dart';

import '../core/theme/app_radius.dart';
import '../core/theme/app_spacing.dart';

class SelectableBox extends StatelessWidget {
  final String? message;

  const SelectableBox({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    // TODO: Implement on gesture to make the button interactive
    return Container(
      padding: const EdgeInsets.all(KayanSpacing.sm),
      decoration: BoxDecoration(
        color: colorTheme.onPrimary,
        border: Border.all(),
        borderRadius: KayanRadius.borderLg,
      ),
      child: Text(message ?? '', style: textTheme.bodyMedium),
    );
  }
}
