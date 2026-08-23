import 'dart:ui';
import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';

class KayanGlassNavigationBar extends StatelessWidget {
  final List<Widget> items;

  const KayanGlassNavigationBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KayanSpacing.md),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KayanRadius.xl),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: KayanSpacing.md),
            decoration: BoxDecoration(
              color: KayanColors.warmCream.withOpacity(0.65),
              borderRadius: BorderRadius.circular(KayanRadius.xl),
              border: Border.all(
                color: KayanColors.deepOnyx.withOpacity(0.1),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: KayanColors.deepOnyx.withOpacity(0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items,
            ),
          ),
        ),
      ),
    );
  }
}