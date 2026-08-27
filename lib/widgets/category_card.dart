import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/models/product_model.dart';

class CategoryCard extends StatelessWidget {
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  const CategoryCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorTheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Stack(
          children: [
            SizedBox(child: Image.network(product.image, fit: BoxFit.cover)),

            Positioned(
              top: KayanSpacing.sm,
              right: KayanSpacing.sm,
              child: GestureDetector(
                onTap: onFavoriteTap,
                child: Container(
                  padding: const EdgeInsets.all(KayanSpacing.sm),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: colorTheme.secondaryContainer,
                  ),
                  child: isFavorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                ),
              ),
            ),
          ],
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: KayanSpacing.xs),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // Description and price
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(product.category, style: textTheme.bodySmall),
                  Text('\$${product.price}', style: textTheme.bodySmall),
                ],
              ),

              Text(product.name, style: textTheme.headlineMedium),
            ],
          ),
        ),
      ],
    );
  }
}
