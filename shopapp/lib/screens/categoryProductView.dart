import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/screens/detailsPageView.dart';
import 'package:shopapp/webservice/categoryProductWeb.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class categoryProductView extends StatefulWidget {
  String category;
  int category_id;
  categoryProductView({required this.category_id,required this.category});

  @override
  State<categoryProductView> createState() => _categoryProductViewState();
}

class _categoryProductViewState extends State<categoryProductView> {
  @override
  Widget build(BuildContext context) {
    print(widget.category);
    return  Scaffold(

      appBar: AppBar(
        title: Text(widget.category,style: TextStyle(color: Colors.black),),
        
      ),

      body: FutureBuilder(
        future: fetchCatagoryProducts(widget.category_id),
        builder: (context, snapshot) {
          if (snapshot.hasData){

            return StaggeredGridView.countBuilder(
              
              crossAxisCount: 2, 
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product=snapshot.data![index];
                return InkWell(
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return detailsPageView(
                      id: product.id!, 
                      name: product.productname!, 
                      image: product.image!, 
                      price: product.price.toString(), 
                      description: product.description!);
                  },));
                  },

                  child: Container(
                    
                    child:Card(
                      
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Column(
                      children: [
                        Image(
                      image:NetworkImage('http://bootcamp.cyralearnings.com/products/'+product.image!)
                      ),

                      Text(product.productname!),
                      Text("RS:${product.price.toString()}",style: TextStyle(color: Colors.red),)
                      
                      ],
                    ) ,
                        ),
                    )
                    
                    
                    
                  ),
                );


              }, 
              
              
              
              
              
              
              
                staggeredTileBuilder: (context) =>
                      const StaggeredTile.fit(1));
            } else {
              return Center(child: CircularProgressIndicator());
            }
              
              
              
          
        },
        
        )
    );
  }
}