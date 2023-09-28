import 'package:flutter/material.dart';
import 'package:shopapp/screens/categoryProductView.dart';
import 'package:shopapp/screens/detailsPageView.dart';
import 'package:shopapp/screens/drawer.dart';
import 'package:shopapp/webservice/categoryWeb.dart';
import 'package:shopapp/webservice/productWeb.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Shopping") ,
      ),
      body: Padding(
        
        padding: EdgeInsets.all(8),
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8,),
          Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          
          FutureBuilder(
            future: fetchCategory(),
            builder:(context, snapshot) {
              
                  if(snapshot.hasData){
                    return Container(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return categoryProductView(
                                    category_id: snapshot.data![index].id!,
                                    category: snapshot.data![index].category!,
                                  );
                                },));
                              },

                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 172, 172, 172)
                                  
                          
                                ),
                                child: Center(
                                  child:Text(snapshot.data![index].category!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)
                                  ),
                              ),
                            ),
                          
                          );
                        },),
                    );
  
                  }

                     else{
                      return Center(child: CircularProgressIndicator());
                    }

                    
            },
            
             ),

             Divider(),
             
              Text("Most Searched Products",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

              SizedBox(height: 12,),
             
     Expanded(
      child: FutureBuilder(
                future:fetchProducts() ,
                builder:(context, snapshot) {
                  if(snapshot.hasData){
                     
                     return Container(
                       child: StaggeredGridView.countBuilder(
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 2, 
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final product=snapshot.data![index];
                          return InkWell(
                            onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return detailsPageView(
                                      id: product.id!, 
                                      name: product.productname!, 
                                      image: product.image!, 
                                      price: product.price.toString(), 
                                      description: product.description!);
                                  },
                                  
                                  ));
                            },

                            child: Container(
                              child: Card(
                                child:Column(
                                children: [
                                  Image(image: NetworkImage('http://bootcamp.cyralearnings.com/products/'+product.image!)),
                                  Text(product.productname!),
                      Text("RS:${product.price.toString()}",style: TextStyle(color: Colors.red),)
                                ],
                              ),
                              )
                            )
                          );
                        }, 
                         staggeredTileBuilder: (context) =>
                      const StaggeredTile.fit(1)) 
                     );
                  }

                  else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
                 )
      
      )

              


        ],
      ),
        
        ),
     
       
      drawer: drawer(),


      
    );
  }
}