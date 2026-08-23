import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_theme.dart';
import 'package:local_brand/pages/home_screen.dart';
import 'package:local_brand/pages/login_screen.dart';
import 'pages/signup_screen.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const KayanApp());
}

class KayanApp extends StatelessWidget {
  const KayanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: KayanTheme.lightTheme,
      home: SignupScreen(),
    );
  }
}