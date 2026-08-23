import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String categoryType;
  final String imageUrl;
  final int price;
  const CategoryCard({super.key, required this.categoryName, required this.categoryType, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return               Column(
                crossAxisAlignment: .start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
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
                          children: [Text(categoryType, style: textTheme.bodySmall,), Text('\$$price', style: textTheme.bodySmall,)],
                        ),


                        Text(categoryName, style: textTheme.headlineMedium,)
                      ],
                    ),
                  ),
                ],
              );
  }
}