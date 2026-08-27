import 'package:flutter/material.dart';
import 'package:local_brand/api/product_service.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/utils/extenstions/capitalized.dart';
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
  final ApiService _api = ApiService();
  List<ProductModel> products = [];
  bool isLoading = true;
  String? errorMessage;
  bool _hasFetched = false;
  bool viewAllProduct = false;
  final Set<ProductModel> favoriteProducts = <ProductModel>{};
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
  void onFavoriteTap(ProductModel product) {
    setState(() {
      if (favoriteProducts.contains(product)) {
        favoriteProducts.remove(product);
      } else {
        favoriteProducts.add(product);
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
          errorMessage = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load products, network problem.';
        });
      }
    }
  }

  void retry() {
    setState(() {
      isLoading = true;
      errorMessage = null;
      _hasFetched = false;
    });
    fetchProducts();
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
                  : errorMessage != null
                  ? Center(
                      child: Column(
                        spacing: KayanSpacing.md,
                        children: [
                          Text(errorMessage!, style: textTheme.bodyMedium),
                          OutlinedButton(
                            onPressed: retry,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'new arrivals'.toCapitalized(),
                              style: textTheme.headlineMedium,
                            ),

                            TextButton(
                              onPressed: () => setState(() {
                                viewAllProduct = !viewAllProduct;
                              }),
                              child: Text(
                                'view all'.toCapitalized(),
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.blue
                                ),
                              ),
                            ),
                          ],
                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: viewAllProduct ? products.length : 10,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            final isFavorite = favoriteProducts.contains(
                              product,
                            );
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.productDetails,
                                  arguments: {
                                    'product': product,
                                    'isFavorite': isFavorite,
                                    'onFavoriteTap': () =>
                                        onFavoriteTap(product),
                                  },
                                );
                              },
                              child: CategoryCard(
                                product: product,
                                onFavoriteTap: () => onFavoriteTap(product),
                                isFavorite: isFavorite,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
        // Categories
      ),
    );
  }
}
