import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/widgets/kayan_network_image.dart';
import 'package:local_brand/models/product_model.dart';

class CategoryCard extends StatelessWidget {
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback? onDeleteTap;
  const CategoryCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteTap, this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorTheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              KayanNetworkImage(
                url: product.image,
                width: double.infinity,
                height: double.infinity,
              ),

              // FAVORITE Button
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

              // DELETE BUTTON
              Positioned(
                top: KayanSpacing.sm,
                left: KayanSpacing.sm,
                child: GestureDetector(
                  onTap: onDeleteTap,
                  child: Container(
                    padding: const EdgeInsets.all(KayanSpacing.sm),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: colorTheme.secondaryContainer,
                    ),
                    child: Icon(Icons.delete, color: colorTheme.error)
                  ),
                ),
              ),
            ],
          ),
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
                  Flexible(
                    child: Text(
                      product.category,
                      style: textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('\$${product.price}', style: textTheme.bodySmall),
                ],
              ),

              Text(
                product.name,
                style: textTheme.headlineMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
