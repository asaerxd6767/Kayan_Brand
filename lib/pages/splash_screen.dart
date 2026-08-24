import 'package:flutter/material.dart';
import 'package:local_brand/core/utils/extenstions/capitalized.dart';
import 'package:local_brand/pages/login_screen.dart';
import '../core/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    toLogin();
  }
  
  void toLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    if(!mounted) return;

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => LoginScreen()));
  }

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
