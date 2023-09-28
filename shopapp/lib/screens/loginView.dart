import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp/screens/home.dart';
import 'package:shopapp/screens/registerView.dart';
class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {


   Future setSession(String username) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  final TextEditingController usernameFilter = new TextEditingController();

  String?  password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final SharedPreferences prefs;



  


   login ( String username, String password )async{
    
    
   try {
     
     print(username);
      print(password);
     var result;
     final Map<String,dynamic> Data =  {
        
        'username': username,
        'password': password,
      };

      final response =await http.post(Uri.parse('http://bootcamp.cyralearnings.com/login.php'),

      body: Data,
      
      );

      print(response.statusCode);

      if(response.statusCode==200){
        if(response.body.contains("success")){
          
        
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("LGIN SUCCESSFULLY COMPLETED")));

       
          print("helloo");
          // prefs.setBool("isLoggedIn", true);
     
     try {
       prefs = await SharedPreferences.getInstance();
       prefs.setString("username", username);
     } catch (e) {
      print(e.toString());
       
     }
               

         // print("usernamer::: $username");
          
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return homePage();
          },));
          
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("LOGIN FAILED")));
        }
      
      }

      else{

         result = {log(json.decode(response.body)['error'].toString())};
         return result;
      }

   } catch (e) {
     
    log(e.toString());

   }
   }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [

             SizedBox(
              height: 50,
            ),
            Text(
              "LogIn Account",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 28),
            
            Form(
              key:_formKey,
              child: Column(
                children: [
                
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
               controller: usernameFilter,
               style: TextStyle(fontSize: 15),
               decoration: InputDecoration(hintText: 'username'),
               validator: (value)  {

                if (value!.isEmpty) {
                   return 'Enter your username ';
                }
                 
               },
              ),
            ),

             Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
               onChanged: (value) {
                 setState(() {
                   password=value;
                 });
               },
               style: TextStyle(fontSize: 15),
               decoration: InputDecoration(hintText: 'password'),
               obscureText: true,
               validator: (value)  {

                if (value!.isEmpty) {
                   return 'Enter your password ';
                }
                 
               },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: TextButton(
                
                style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                          primary: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                
                onPressed: (){
                   String username=usernameFilter.text;
                  if(_formKey.currentState!.validate()){
                     login(username, password!);

               
                  }
                }, 
                
                child: Text("Login")),

              )
                ],
              ),
              
              ),

              Padding(padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => registerView()));
                },

                child: Text("Already have no account? click here"),
              ),
              )

            
          ],
        ),
      ),
    );
  }
}




  //  @override
  // void initState() {
  //   super.initState();
  //   _loadCounter();
  // }

  // void _loadCounter() async {
  //   prefs = await SharedPreferences.getInstance();
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   log("isloggedin = " + isLoggedIn.toString());
  //   if (isLoggedIn) {
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => homePage()));
  //   }
  // }