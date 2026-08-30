import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_color.dart';

/*
Pure branded splash screen, shown while Firebase reads the auth state
(see main.dart). Routing is driven by the auth stream in main.dart, so
this screen does no navigation itself.
*/

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
              'kayan'.toUpperCase(),
              style: textTheme.headlineLarge?.copyWith(
                color: colorTheme.secondary,
              ),
            ),
            Text(
              'Couture for the Modern Soul',
              style: textTheme.bodyMedium?.copyWith(color: colorTheme.outline),
            ),
            SizedBox(height: 32),
            CircularProgressIndicator(color: colorTheme.secondary),
          ],
        ),
      ),
    );
  }
}
