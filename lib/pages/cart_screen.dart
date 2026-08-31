import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/managers/product_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _manager = ProductManager.instance;

    return SingleChildScrollView(
      padding: EdgeInsets.all(KayanSpacing.md),
      child: Column(
        spacing: KayanSpacing.base,
        children: [
          Text('Favorites', style: textTheme.headlineLarge,),

          
        ],
      ),
    );
  }
}