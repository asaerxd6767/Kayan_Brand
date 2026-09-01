import 'package:flutter/material.dart';

import '../core/theme/app_spacing.dart';

/// A responsive grid for product cards. It stacks in a single column on
/// phones and expands into more columns as the available width grows, keeping
/// each card a comfortable, human-friendly size. Works the same on phones,
/// tablets and desktop browsers.
class ProductGrid extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsetsGeometry padding;
  final double spacing;

  /// Reserve height for the text block below each card image.
  final double textBlockHeight;

  const ProductGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding = EdgeInsets.zero,
    this.spacing = KayanSpacing.base,
    this.textBlockHeight = 100,
  });

  int _crossAxisCountFor(double width) {
    // Choose columns from the actual grid width so cards stay a consistent,
    // comfortable size. This avoids cards that are far too wide on mid-sized
    // (tablet) screens.
    if (width >= 1080) return 4;
    if (width >= 800) return 3;
    if (width >= 540) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final count = _crossAxisCountFor(width);
        final cellWidth = (width - spacing * (count - 1)) / count;
        // Cards use a 3:4 image ratio, plus a fixed text block below.
        final imageHeight = cellWidth * 4 / 3;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: padding,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            mainAxisExtent: imageHeight + textBlockHeight,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}