import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('username');
  return username;
}
