import 'package:flutter/material.dart';
import 'package:local_brand/api/firebase_service.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/utils/extenstions/capitalized.dart';
import 'package:local_brand/managers/product_manager.dart';
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
  final FirebaseService _api = FirebaseService.instance;
  late Future<List<ProductModel>> _productsFuture;
  bool viewAllProduct = false;
  final ProductManager _manager = ProductManager.instance;
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

  void retry() {
    setState(() {
      _productsFuture = _api.getProducts();
    });
  }

  @override
  void initState() {
    super.initState();
    _productsFuture = _api.getProducts();
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

              // ========= display the products =========
              FutureBuilder(
                future: _productsFuture,
                builder: (context, snapshot) {
                  
                  // ==================== (Loading)
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // ==================== (Error)
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        spacing: KayanSpacing.md,
                        children: [
                          Text(
                            'Failed to load: ${snapshot.error}',
                            style: textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          OutlinedButton(
                            onPressed: retry,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  // ==================== (Recieved data)
                  _manager.allProducts = snapshot.data!;

                  // ==================== (Empty)
                  if(_manager.allProducts.isEmpty) {
                    return  Container(
                    padding: EdgeInsets.symmetric(vertical: KayanSpacing.xl),
                    child: Center(
                      child: Text(
                        'No products yet.',
                        style: textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                  } else {
                  // ==================== (Data)
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),

                      ListenableBuilder(
                        listenable: _manager,
                        builder: (context, _) => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _manager.allProducts.length,

                          itemBuilder: (context, index) {
                            final product = _manager.allProducts[index];
                            final isFavorite = _manager.isFavorite(product);
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.productDetails,
                                  arguments: {
                                    'product': product,
                                    'isFavorite': isFavorite,
                                    'onFavoriteTap': () =>
                                        _manager.toggleFavorite(product),
                                  },
                                );
                              },
                              child: CategoryCard(
                                product: product,
                                onFavoriteTap: () =>
                                    _manager.toggleFavorite(product),
                                isFavorite: isFavorite,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
