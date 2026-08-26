import 'package:flutter/material.dart';
import 'package:local_brand/home.dart';
import 'package:local_brand/pages/add_product_screen.dart';
import 'package:local_brand/pages/login_screen.dart';
import 'package:local_brand/pages/signup_screen.dart';
import 'package:local_brand/pages/splash_screen.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    // I will use this to pass the arguments in the future screens
    final argument = settings.arguments;

    switch(settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen(),);

      case Routes.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen(),);

      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeLayout(),);

      case Routes.addProduct:
        return MaterialPageRoute(builder: (context) => const AddProductScreen());

      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Text('No page here'),
        ),);

    }
  }
}