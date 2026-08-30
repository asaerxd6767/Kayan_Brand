import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_brand/api/auth_service.dart';
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
    return StreamBuilder<User?>(
      stream: AuthService.instance.authStateChanges,
      builder: (context, snapshot) {
        // While Firebase decides whether a session exists, show the splash.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: KayanTheme.lightTheme,
            onGenerateRoute: AppRouter().generateRoute,
            initialRoute: Routes.splash,
          );
        }

        // Signed in -> Home, otherwise -> Login. Reacts automatically to logout.
        final isSignedIn = snapshot.data != null;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: KayanTheme.lightTheme,
          onGenerateRoute: AppRouter().generateRoute,
          initialRoute: isSignedIn ? Routes.home : Routes.login,
        );
      },
    );
  }
}
