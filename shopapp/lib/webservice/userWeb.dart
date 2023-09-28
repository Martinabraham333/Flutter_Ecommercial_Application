
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shopapp/models/userModel.dart';

Future<UserModel?> fetchUser(String username) async {
    try {
      final response = await http.post(Uri.parse('http://bootcamp.cyralearnings.com/get_user.php'),
          body: {'username': username});

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load User');
      }
    } catch (e) {
      log(e.toString());
    }
  }
