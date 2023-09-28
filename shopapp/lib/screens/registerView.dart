import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/screens/loginView.dart';
class registerView extends StatefulWidget {
  const registerView({super.key});

  @override
  State<registerView> createState() => _registerViewState();
}

class _registerViewState extends State<registerView> {

  String? name, phone, address, username, password;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  registration(String name, phone, address, username, password) async{

   try {
     
     print(username);
      print(password);
     var result;
     final Map<String,dynamic> Data =  {
        'name': name,
        'phone': phone,
        'address': address,
        'username': username,
        'password': password,
      };

      final response =await http.post(Uri.parse('http://bootcamp.cyralearnings.com/registration.php'),

      body: Data,
      
      );

      print(response.statusCode);

      if(response.statusCode==200){
        if(response.body.contains("success")){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("REGISTRATION SUCCESSFULLY COMPLETED")));

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return loginView();
          },));
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("REGISTRATION FAILED")));
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
              "Register Account",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Complete your details  \n",
            ),
            SizedBox(height: 28),
            
            Form(
              key:_formkey,
              child: Column(
                children: [
                  Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
               onChanged: (value) {
                 setState(() {
                   name=value;
                 });
               },
               style: TextStyle(fontSize: 15),
               decoration: InputDecoration(hintText: 'Name'),
               validator: (value)  {

                if (value!.isEmpty) {
                   return 'Enter your Name ';
                }
                 
               },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
               onChanged: (value) {
                 setState(() {
                   phone=value;
                 });
               },
               style: TextStyle(fontSize: 15),
               decoration: InputDecoration(hintText: 'Phone'),
               validator: (value)  {

                if (value!.isEmpty) {
                   return 'Enter your Phone ';
                }

                else if (value.length > 10 ||
                                  value.length < 10) {
                                return "Please enter valid phone number ";
                              }
                 
               },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
               onChanged: (value) {
                 setState(() {
                   address=value;
                 });
               },
               style: TextStyle(fontSize: 15),
               decoration: InputDecoration(hintText: 'address'),
               validator: (value)  {

                if (value!.isEmpty) {
                   return 'Enter your address ';
                }
                 
               },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
               onChanged: (value) {
                 setState(() {
                   username=value;
                 });
               },
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
                  if(_formkey.currentState!.validate()){
                     registration(name!, phone, address, username, password);
                  }
                }, 
                
                child: Text("register")),

              )
                ],
              ),
              
              ),
              SizedBox(height: 10),

              Row(
                
                children: [

                  Text("Do you have an account? ",
                  style: TextStyle(fontSize: 16),
                
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return loginView();
                      },
                    
                    ));
                    },

                    child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        // Color.fromARGB(255, 5, 1, 50),
                        fontWeight: FontWeight.bold),
                  ),
                  )

                ],)

            
          ],
        ),
      ),

      
    );
  }
}