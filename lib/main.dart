import 'package:flutter/material.dart';
import 'package:local_brand/core/routing/app_router.dart';
import 'package:local_brand/core/theme/app_theme.dart';
import 'core/routing/routes.dart';
import 'pages/add_product_screen.dart';

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
      // initialRoute: Routes.splash,
      // onGenerateRoute: AppRouter().generateRoute,
      home: AddProductScreen(),
    );
  }
}