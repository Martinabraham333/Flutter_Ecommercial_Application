import 'dart:convert';
import 'dart:developer';

import 'package:shopapp/models/categoryModel.dart';
import 'package:http/http.dart' as http;

Future<List<CategoryModel>?> fetchCategory() async{

try {
  final response= await http.get(Uri.parse('http://bootcamp.cyralearnings.com/getcategories.php'));

  if(response.statusCode==200){
    final parsed=json.decode(response.body).cast<Map<String,dynamic>>();

    print(parsed);
    
    

    return parsed.map<CategoryModel>((json) =>CategoryModel.fromJson(json)).toList();
     
  }
  
} catch (e) {
   log(e.toString());
}

}