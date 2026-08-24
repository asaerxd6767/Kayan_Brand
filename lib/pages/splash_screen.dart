import 'package:flutter/material.dart';
import '../core/theme/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: KayanColors.deepOnyx,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'KAYAN',
              style: textTheme.headlineLarge?.copyWith(
                color: colorTheme.secondary,
              ),
            ),
            Text(
              'Couture for the Modern Soul',
              style: textTheme.bodyMedium?.copyWith(color: colorTheme.outline),
            ),
          ],
        ),
      ),
    );
  }
}
