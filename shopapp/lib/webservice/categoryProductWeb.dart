import 'dart:convert';
import 'dart:developer';

import 'package:shopapp/models/productModel.dart';
import 'package:http/http.dart' as http;
Future<List<ProductModel>> fetchCatagoryProducts(int catid) async {
   
    final response = await http.post(
        Uri.parse('http://bootcamp.cyralearnings.com/get_category_products.php'),
        body: {'catid': catid.toString()});
    
    if (response.statusCode == 200) {
      
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();

    }
     else {
      throw Exception('Failed to load category products');
    }
  }