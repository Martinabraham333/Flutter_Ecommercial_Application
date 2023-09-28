import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cartProvider.dart';
import 'package:shopapp/screens/cartPage.dart';
import 'package:shopapp/screens/home.dart';
import 'package:shopapp/screens/loginView.dart';
import 'package:shopapp/screens/orderDetail.dart';

import 'package:badges/badges.dart' as badges;
class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
       
       child: ListView(
             children: [

                 DrawerHeader(
                  child: Text("ShopCart",
                         style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
          
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://tse3.mm.bing.net/th?id=OIP.QJRc3bgYyt1GkKW7QskrSQHaDD&pid=Api&P=0&h=180'),
                      fit: BoxFit.cover
                      )
                 
                  ),
                  ),

                 ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homePage()));
                    
                  },
                 ),

                 ListTile(
                  leading: badges.Badge(
                  showBadge:
                      //  true,
                      context.read<Cart>().getItems.isEmpty ? false : true,
                  badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
                  badgeContent: Text(
                    context.watch<Cart>().getItems.length.toString(),
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    
                    // size: 15,
                  )),
                  title: Text("Cart page"),
                    onTap: () {
                      

                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()));
                   
                  },
                 ),

                 ListTile(
                  leading: Icon(Icons.book_online),
                  title: Text("Order Details"),
                    onTap: () {
                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderdetailsPage()));
                  },
                 ),

                  Divider(),

                 ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("LogOut"),
                  onTap: () {

                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loginView()));
                    
                  },
                 ),
             ],

       ),

      

    );
  }
}