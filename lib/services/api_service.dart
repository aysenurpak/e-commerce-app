import 'dart:convert';
import 'package:e_commerce/models/product_models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ProductModel> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://wantapi.com/products.php'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
