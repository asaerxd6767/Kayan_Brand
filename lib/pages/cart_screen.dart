import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/managers/product_manager.dart';
import 'package:local_brand/widgets/category_card.dart';

import '../core/routing/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final manager = ProductManager.instance;

    return SingleChildScrollView(
      padding: EdgeInsets.all(KayanSpacing.md),
      child: Column(
        spacing: KayanSpacing.base,
        children: [
          Text('Favorites', style: textTheme.headlineLarge),
          ListenableBuilder(
            listenable: manager,
            builder: (context, _) => manager.cartProducts.isEmpty
                ? Text(
                    'The cart is empty, please add the products you want',
                    textAlign: .center,
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: manager.cartProducts.length,
                    itemBuilder: (context, index) {
                      final product = manager.cartProducts[index];
                      final isFavorite = manager.isFavorite(product);
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.productDetails,
                            arguments: {
                              'product': product,
                              'isFavorite': isFavorite,
                              'onFavoriteTap': () =>
                                  manager.toggleFavorite(product),
                            },
                          );
                        },
                        child: CategoryCard(
                          product: product,
                          onFavoriteTap: () => manager.toggleFavorite(product),
                          isFavorite: isFavorite,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
