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

  // ---- Products ----
  Future<List<ProductModel>> getProducts() async {
    final db = _db ?? FirebaseFirestore.instance;
    final snapshot = await db.collection('products').get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList();
  }
}
