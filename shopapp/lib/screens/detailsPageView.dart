import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cartProvider.dart';
import 'package:collection/collection.dart';

class detailsPageView extends StatefulWidget {
   String name, price, image, description;
  int id;
   detailsPageView({required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.description});

  @override
  State<detailsPageView> createState() => _detailsPageViewState();
}

class _detailsPageViewState extends State<detailsPageView> {

  
  Widget build(BuildContext context) {
    
   
    return  Scaffold(

      appBar: AppBar(
        
      ),

      body: SingleChildScrollView(
        child:Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image(
                  image: NetworkImage(
                    'http://bootcamp.cyralearnings.com/products/'+widget.image!
                  )),
                  
                  Card(
                    child:Padding(
                      padding: EdgeInsets.all(15),
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
                        Text("RS: ${widget.price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(widget.description)

                      ],
                    ),
                    )
                    
                  ),

                  
                  
              ],
            ),
            ),
        )
        
         ),

         
        bottomSheet: Padding(
          padding: EdgeInsets.all(18),
          child: InkWell(
            onTap: () {
            
            var existingCart = context.read<Cart>().getItems.firstWhereOrNull((element) => element.id==widget.id);

            print(existingCart);

            if (existingCart!=null){

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This item already in cart")));
            }

            else{
             
             context.read<Cart>().addItem(widget.id, widget.name, double.parse(widget.price), 1, widget.image);

             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Add to cart"))); 
            }




              
  
            },

            child: Container(
               height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text("add to cart",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black
              ),
            ),

          ),
          ),
    );
  }
}