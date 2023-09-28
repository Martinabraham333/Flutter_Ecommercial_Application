 import 'dart:convert';
import 'dart:developer';

import 'package:shopapp/models/orderDetailModel.dart';
import 'package:http/http.dart' as http;
Future<List<OrderModel>?> fetchOrderDetails(String username) async {
    try {
      print("Username:${username}");
      final response = await http.post(
          Uri.parse('http://bootcamp.cyralearnings.com/get_orderdetails.php'),
          body: {'username': username.toString()});

      if (response.statusCode == 200) {

        print("awe:${response.statusCode}");
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        print("awe:${parsed}");
        
        return parsed.map<OrderModel>((json) => OrderModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load order details');
      }
    } catch (e) {
      print("order detailsss ==" + e.toString());
    }
  }
