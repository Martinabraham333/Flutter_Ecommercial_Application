import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cartProvider.dart';
import 'package:shopapp/screens/home.dart'; // Import your home page here
import 'package:shopapp/screens/loginView.dart'; // Import your login page here
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Cart()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  // Function to check if the user is logged in
void initState() {
    super.initState();
    _loadUsername();
  }

 String? username;

  void _loadUsername() async {
    // final prefs = await SharedPreferences.getInstance();
    SharedPreferences prefs =await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString('username');
    });
    print("isloggedin = " + username.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:username == null ? loginView(): homePage()  , // Use a conditional statement to navigate to either the home page or login page
    );
  }
}
