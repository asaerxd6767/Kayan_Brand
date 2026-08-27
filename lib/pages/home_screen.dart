import 'package:flutter/material.dart';
import 'package:local_brand/api/product_service.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/widgets/category_card.dart';
import 'package:local_brand/widgets/form_field.dart';

import '../core/routing/routes.dart';
import '../models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final ApiService _api = ApiService();
  List<ProductModel> products = [];
  bool isLoading = true;
  bool _hasFetched = false;
  final Set<int> favoriteProducts = <int>{};
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
  void onFavoriteTap(int index) {
    setState(() {
      if (favoriteProducts.contains(index)) {
        favoriteProducts.remove(index);
      } else {
        favoriteProducts.add(index);
      }
    });
  }

  void fetchProducts() async {
    if (_hasFetched) return;
    _hasFetched = true;

    try {
      final result = await _api.getProduct();
      if (mounted) {
        setState(() {
          products = result;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

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
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final isFavorite = favoriteProducts.contains(index);
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.productDetails,
                              arguments: {
                                'product': products[index],
                                'isFavorite': isFavorite,
                                'onFavoriteTap': () => onFavoriteTap(index),
                              },
                            );
                          },
                          child: CategoryCard(
                            product: products[index],
                            onFavoriteTap: () => onFavoriteTap(index),
                            isFavorite: isFavorite,
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
        // Categories
      ),
    );
  }
}
