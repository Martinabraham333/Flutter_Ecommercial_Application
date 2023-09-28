import 'dart:convert';

import 'package:shopapp/models/productModel.dart';
import 'package:http/http.dart' as http;
Future<List<ProductModel>> fetchProducts() async {
    
    final response = await http.get(Uri.parse('http://bootcamp.cyralearnings.com/view_offerproducts.php'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }