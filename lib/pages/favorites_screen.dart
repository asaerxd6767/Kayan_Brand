import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/utils/responsive.dart';
import 'package:local_brand/managers/product_manager.dart';
import 'package:local_brand/widgets/category_card.dart';
import 'package:local_brand/widgets/product_grid.dart';

import '../core/routing/routes.dart';
import '../models/product_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final ProductManager _manager = ProductManager.instance;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _manager,
      builder: (context, _) {
        final textTheme = Theme.of(context).textTheme;
        final favorites = _manager.favoriteProducts.toList();

        return SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(KayanSpacing.md),
              constraints: const BoxConstraints(
                maxWidth: AppBreakpoints.desktopContentWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Favorites', style: textTheme.headlineLarge),

                  if (favorites.isEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: KayanSpacing.xl),
                      child: Center(
                        child: Text(
                          'No favorites yet.\nTap the heart on a product to save it here.',
                          style: textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  else
                    ProductGrid(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final ProductModel product = favorites[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.productDetails,
                              arguments: {
                                'product': product,
                                'isFavorite': _manager.isFavorite(product),
                                'onFavoriteTap': () =>
                                    _manager.toggleFavorite(product),
                              },
                            );
                          },
                          child: CategoryCard(
                            product: product,
                            onFavoriteTap: () =>
                                _manager.toggleFavorite(product),
                            isFavorite: _manager.isFavorite(product),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}