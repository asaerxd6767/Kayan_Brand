import 'package:flutter/foundation.dart';
import 'package:local_brand/models/product_model.dart';

/*
A shared in-memory data store.

Because it's a singleton, there is only ONE instance across the whole app.
Any screen that touches `ProductManager.instance` reads/writes the same data,
so Favorites and Cart stay in sync everywhere.

It extends ChangeNotifier so that, whenever the data changes, we can call
notifyListeners() and every interested widget (via ListenableBuilder) will
automatically rebuild itself.
*/

class ProductManager extends ChangeNotifier {
  ProductManager._();

  static final ProductManager instance = ProductManager._();

  List<ProductModel> _allProducts = <ProductModel>[];
  List<ProductModel> get allProducts => _allProducts;

  set allProducts(List<ProductModel> value) {
    if (identical(_allProducts, value)) return;
    _allProducts = value;
  }

  final Set<ProductModel> favoriteProducts = <ProductModel>{};
  final List<ProductModel> cartProducts = <ProductModel>[];

  // ---- Favorites ----
  void toggleFavorite(ProductModel product) {
    if (!favoriteProducts.remove(product)) {
      favoriteProducts.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(ProductModel product) => favoriteProducts.contains(product);

  // ---- Cart ----
  void addToCart(ProductModel product) {
    if (!cartProducts.contains(product)) {
      cartProducts.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    cartProducts.remove(product);
    notifyListeners();
  }

  bool isInCart(ProductModel product) => cartProducts.contains(product);
}
