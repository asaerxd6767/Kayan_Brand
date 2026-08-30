import 'package:flutter/material.dart';
import 'package:local_brand/api/auth_service.dart';
import 'package:local_brand/core/routing/app_router.dart';
import 'package:local_brand/core/theme/app_color.dart';
import 'package:local_brand/core/theme/app_theme.dart';
import '../core/routing/routes.dart';

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
            SizedBox(height: 32),
            CircularProgressIndicator(color: colorTheme.secondary),
          ],
        ),
      ),
    );
  }
}

/// Hosts the splash screen while waiting for auth state.
/// A timeout guarantees we never get stuck on the splash forever.
class SplashHost extends StatefulWidget {
  const SplashHost({super.key});

  @override
  State<SplashHost> createState() => _SplashHostState();
}

class _SplashHostState extends State<SplashHost> {
  MaterialApp? _bufferedApp;

  @override
  void initState() {
    super.initState();
    // safety net: if auth hasn't resolved after 4s, fall back to login.
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      final app = AuthService.instance.currentUser == null
          ? _buildApp(Routes.login)
          : _buildApp(Routes.home);
      setState(() => _bufferedApp = app);
    });
  }

  MaterialApp _buildApp(String route) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: KayanTheme.lightTheme,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: route,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _bufferedApp ??
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: KayanTheme.lightTheme,
          home: const SplashScreen(),
        );
  }
}
