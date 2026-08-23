import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
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
                color: KayanColors.warmCream
              ),
            ),
            Text('Couture for the Modern Soul', style: textTheme.bodyMedium?.copyWith(
              color: KayanColors.outline
            ),),
          ],
        ),
      ),
    );
  }
}
