import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_brand/models/product_model.dart';

import '../firebase_options.dart';

/*
A thin wrapper around Cloud Firestore.

For now it only reads the products collection so the home screen can display
products straight from Firebase. More write operations can be added later.
*/

class FirebaseService {
  FirebaseService._();

  static final FirebaseService instance = FirebaseService._();

  FirebaseFirestore? _db;

  // ---- Bootstrapping (call once from main()) ----
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _db = FirebaseFirestore.instance;
  }

  // ================= Products =================

  CollectionReference get _products =>
      (_db ?? FirebaseFirestore.instance).collection('products');

  // ---------------------- CREATE
  // The product ProductModel.id is used as the Firestore document id so (easy to update/delete later).
  Future<void> createProduct(ProductModel product) async {
    await _products.doc(product.id.toString()).set(product.toMap());
  }

  // ---------------------- READ
  // The read is used once, but streams listens if there's changes
  Future<List<ProductModel>> getProducts() async {
    final snapshot = await _products.get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  /// Stream that emits the products list whenever the collection changes.
  Stream<List<ProductModel>> productsStream() {
    return _products.snapshots().map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  // ---------------------- UPDATE
  Future<void> updateProduct(ProductModel product) async {
    await _products.doc(product.id.toString()).set(product.toMap());
  }

  // ---------------------- UPDATE with ID
  Future<void> updateProductFields(int id, Map<String, dynamic> fields) async {
    await _products.doc(id.toString()).update(fields);
  }

  // ---------------------- DELETE
  Future<void> deleteProduct(int id) async {
    await _products.doc(id.toString()).delete();
  }
}
