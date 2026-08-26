import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/widgets/category_card.dart';
import 'package:local_brand/widgets/form_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> categories = [
    'New Arrivals',
    'Men',
    'Women',
    'Streetwear',
    'Accessories',
    'Outerwear',
    'Footwear',
    'Limited Edition',
  ];
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Structured Overcoat',
      'category': 'Outerwear',
      'price': 895,
      'image':
          'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'Oversized Cotton Hoodie',
      'category': 'Streetwear',
      'price': 320,
      'image':
          'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'Tailored Wool Trousers',
      'category': 'Men',
      'price': 450,
      'image':
          'https://images.unsplash.com/photo-1617137984095-74e4e5e3613f?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'Minimalist Leather Bag',
      'category': 'Accessories',
      'price': 680,
      'image':
          'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'name': 'Double-Breasted Blazer',
      'category': 'Women',
      'price': 790,
      'image':
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1000&auto=format&fit=crop',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(KayanSpacing.containerMargin),
        child: Form(
          child: Column(
            spacing: KayanSpacing.md,
            children: [
              // Search bar
              MyTextField(
                hintText: 'Search Collection',
                prefixIcon: Icon(Icons.search),
              ),

              // Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: KayanSpacing.sm,
                  children: categories
                      .map(
                        (category) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          child: Text(category, style: textTheme.labelLarge),
                        ),
                      )
                      .toList(),
                ),
              ),

              // Cards
              Column(
                spacing: KayanSpacing.md,
                children: products
                    .map(
                      (element) => CategoryCard(
                        categoryName: element['name'],
                        categoryType: element['category'],
                        imageUrl: element['image'],
                        price: element['price'],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        // Categories
      ),
    );
  }
}
