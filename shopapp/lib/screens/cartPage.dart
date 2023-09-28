import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cartProvider.dart';
import 'package:shopapp/screens/checkOutPage.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartProduct> cartlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddToCart"),
      ),
      // body: Consumer<Cart>(
      //   builder: (context, cart, child) {
      //     final cartList = cart.getItems;
      //     return cartList.isEmpty
      //         ? Center(child: Text('Empty'))
      //         : ListView.builder(
      //             itemCount: cart.count,
      //             itemBuilder: (context, index) {
      //               return Padding(
      //                 padding: EdgeInsets.all(10),
      //                 child: Container(
      //                   height: 100,
      //                   width: MediaQuery.of(context).size.width,
      //                   child: Card(
      //                     child: Row(
      //                       children: [
      //                         SizedBox(
      //                           height: 80,
      //                           width: 100,
      //                           child: Padding(
      //                             padding: EdgeInsets.all(8),
      //                             child: Container(
      //                               decoration: BoxDecoration(
      //                                 image: DecorationImage(
      //                                   image: NetworkImage(
      //                                     'http://bootcamp.cyralearnings.com/products/' +
      //                                         cartList[index].imagesUrl,
      //                                   ),
      //                                   fit: BoxFit.fill,
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: EdgeInsets.all(15),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: [
      //                               Text(
      //                                 cartList[index].name,
      //                                 style: TextStyle(
      //                                   color: Colors.brown,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 20,
      //                                 ),
      //                               ),
      //                               Text(
      //                                 cartList[index].price.toString(),
      //                                 style: TextStyle(
      //                                   color: Colors.red,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 20,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         IconButton(
      //                           onPressed: () {
      //                             cartList[index].qty == 1
      //                                 ? cart.removeItem(cartList[index])
      //                                 : cart.reduceByOne(cartList[index]);
      //                           },
      //                           icon: cartList[index].qty == 1
      //                               ? Icon(Icons.delete, size: 20)
      //                               : Icon(Icons.minimize_rounded, size: 20),
      //                         ),
      //                         Text(cartList[index].qty.toString()),
      //                         IconButton(
      //                           onPressed: () {
      //                             cart.increment(cartList[index]);
      //                           },
      //                           icon: Icon(Icons.add, size: 20),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             },
      //           );
      //   },
      // ),

 body: context.watch<Cart>().getItems.isEmpty
            ? Center(
                child: Text("Empty Cart"),
              )
            : Consumer<Cart>(builder: (context, cart, child) {
                cartlist = cart.getItems;
                return ListView.builder(
                    itemCount:
                        // 2,
                        cart.count,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: SizedBox(
                              height: 100,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 9),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.amber,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'http://bootcamp.cyralearnings.com/products/'+cartlist[index].imagesUrl
                                                  // cart.getItems[index].imagesUrl
                                                  // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGUU3VWK2nTbvZRiUCORkJJ80S4JrCoCqoYQ&usqp=CAU",
                                                  ),
                                              fit: BoxFit.fill),
                                        ),
                                        // child: Image.network(product.imagesUrl.first)
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Wrap(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              cartlist[index].name,
                                              // "product name",
                                              // cart.getItems[index].name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(
                                                      97, 97, 97, 1)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  // "2000",
                                                  cartlist[index]
                                                      .price
                                                      .toString(),
                                                  // cart.getItems[index].price
                                                  //     .toString(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.red.shade900),
                                                ),
                                                Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            cartlist[index]
                                                                        .qty ==
                                                                    1
                                                                ? cart.removeItem(
                                                                    cart.getItems[
                                                                        index])
                                                                : cart.reduceByOne(
                                                                    cartlist[
                                                                        index]);
                                                          },
                                                          icon: cartlist[index]
                                                                      .qty ==
                                                                  1
                                                              ? Icon(
                                                                  Icons.delete,
                                                                  size: 18,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .minimize_rounded,
                                                                  size: 18,
                                                                )),
                                                      Text(
                                                          // cart.getItems[index].qty
                                                          //     .toString(),
                                                          cartlist[index]
                                                              .qty
                                                              .toString(),
                                                          // "2",
                                                          style: TextStyle(
                                                              fontSize: 20,

                                                              // fontFamily: 'Acme',
                                                              color: Colors.red
                                                                  .shade900)),
                                                      IconButton(
                                                          onPressed: () {
                                                            cart.increment(
                                                                cartlist[
                                                                    index]);
                                                          },
                                                          icon: const Icon(
                                                            Icons.add,
                                                            size: 18,
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      );
                    });
                // }
              }),


      bottomSheet: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ${context.watch<Cart>().totalPrice.toString()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            InkWell(
              onTap: () {
                final cart = context.read<Cart>();
                if (cart.getItems.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Empty Cart")),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CheckoutPage(cart: cart.getItems,);
                    }),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    "Order Now",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
