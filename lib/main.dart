import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_brand/api/auth_service.dart';
import 'package:local_brand/api/firebase_service.dart';
import 'package:local_brand/core/routing/app_router.dart';
import 'package:local_brand/core/theme/app_theme.dart';
import 'package:local_brand/pages/splash_screen.dart';
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashHost();
        }

        // Signed in -> Home, otherwise -> Login. Reacts automatically to logout.
        final isSignedIn = snapshot.data != null;
        // The ValueKey forces a fresh navigator when the auth state flips,
        // so the new initialRoute (home vs login) is actually applied.
        return MaterialApp(
          key: ValueKey(isSignedIn),
          debugShowCheckedModeBanner: false,
          theme: KayanTheme.lightTheme,
          onGenerateRoute: AppRouter().generateRoute,
          initialRoute: isSignedIn ? Routes.home : Routes.login,
        );
      },
    );
  }
}
