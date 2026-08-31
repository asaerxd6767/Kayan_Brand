import 'package:flutter/material.dart';
import 'package:local_brand/home.dart';
import 'package:local_brand/pages/screens.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    // I will use this to pass the arguments in the future screens
    final argument = settings.arguments;

    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case Routes.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeLayout());

      case Routes.addProduct:
        return MaterialPageRoute(
          builder: (context) => const AddProductScreen(),
        );

      case Routes.productDetails:
        final product = argument as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ProductDetails(
            product: product['product'],
            isFavorite: product['isFavorite'],
            onFavoriteTap: product['onFavoriteTap'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(body: Text('No page here')),
        );
    }
  }
}
