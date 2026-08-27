import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  Future<List<ProductModel>> getProduct() async {
    String apiUrl = 'https://api.escuelajs.co/api/v1/products';

    final response = await http.get(Uri.parse(apiUrl));

    if(response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((value) => ProductModel.fromJson(value)).toList();
    }
    else {
      throw Exception('Error');
    }
  }
}
