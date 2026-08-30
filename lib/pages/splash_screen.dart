import 'package:flutter/material.dart';
import '../core/theme/app_color.dart';

/*
Splash is shown while Firebase reads the auth state (see main.dart).
Routing is driven by the auth stream, so this screen no longer navigates itself.
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
          ],
        ),
      ),
    );
  }
}
