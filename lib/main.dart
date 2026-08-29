import 'package:flutter/material.dart';
import 'package:local_brand/api/firebase_service.dart';
import 'package:local_brand/core/routing/app_router.dart';
import 'package:local_brand/core/theme/app_theme.dart';
import 'core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.instance.initialize();
  runApp(const KayanApp());
}

class KayanApp extends StatelessWidget {
  const KayanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: KayanTheme.lightTheme,
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}