import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/screens/add_cart_bloc/addcart_bloc.dart';
import 'package:ecommerce_app/screens/add_cart_bloc/addcart_event.dart';
import 'package:ecommerce_app/screens/add_cart_bloc/addcart_state.dart';
import 'package:ecommerce_app/screens/home/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutProductPage extends StatefulWidget {
  DataModel selectedProduct;
  AboutProductPage({required this.selectedProduct});

  @override
  State<AboutProductPage> createState() => _AboutProductPageState();
}

class _AboutProductPageState extends State<AboutProductPage> {

  bool isLoading = false;
  int qty =1;

  List<Color> productColors = [
    Colors.redAccent,
    Colors.black,
    Colors.blue,
    Colors.brown,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.share),
            SizedBox(width: 21,),
            Icon(Icons.favorite_border)
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(widget.selectedProduct.image
                         // "assets/images/buds.jpg"
                      ),fit: BoxFit.contain
                    )
                  ),
                ),
                SizedBox(height: 21,),
                Text(widget.selectedProduct.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 11,),
                Text(widget.selectedProduct.price,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 11,),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.star,color: Colors.white,size: 18,),
                          Text("4.8",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(width: 11,),
                    Text("(320 reviews)",style: TextStyle(color: Colors.grey),),
                    Expanded(
                      flex: 1,
                        child: SizedBox(width: 5,)),
                    Text("Seller: Tariqul islam",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 11,),
                Text("Color",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 11,),
                SizedBox(
                  height: 50,
                 // width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: productColors.length,
                      itemBuilder: (_,index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 30,
                        width: 40,
                        decoration: BoxDecoration(
                            color: productColors[index],
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 21,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Center(
                            child: Text("Description",style: TextStyle(fontSize: 16,color: Colors.white),))),
                    Text("Specifications",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Text("Reviews",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: 11,),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Text("Earbuds are a type of headphones that fit snugly inside your ear canal. They’re popular because they’re small and portable and don’t leak sound like other types of headphones do. Earbuds can be used for any audio device, from phones and tablets to laptops and mp3 players."),
                )
              ],
            ),
          ),
        ),
          BlocListener<AddcartBloc,AddcartState>(
            listener:(context,state){
              if(state is AddcartLoadingState){
                isLoading=true;
                setState(() {

                });
              }else if(state is AddcartErrorState){
                isLoading=false;
                setState(() {

                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
              }else if(state is AddcartLoadedState){
                isLoading = false;
                setState(() {

                });
              }
            } ,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 65,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(35)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 1,),
                        Container(
                          height: 32,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 1,
                                    blurRadius: 1
                                )
                              ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  if(qty>1){
                                    qty--;
                                    setState(() {

                                    });
                                  }
                                },
                                  child: Text("-",style: TextStyle(color: Colors.white,fontSize: 20),)),
                              Text("$qty",style: TextStyle(color: Colors.white,fontSize: 20),),

                              InkWell(
                                onTap: () {
                                  qty++;
                                  setState(() {

                                  });
                                },
                                  child: Text("+",style: TextStyle(color: Colors.white,fontSize: 20),)),
                            ],
                          ),
                        ),
                        SizedBox(width: 11,),
                        InkWell(
                          onTap: () {
                            context.read<AddcartBloc>().add(AddToCartEvent(mParams: {
                              "product_id" : widget.selectedProduct.id,
                              "quantity" :qty
                            }));
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(selectedProduct: widget.selectedProduct,)));
                          },
                          child: Container(
                            height: 50,
                            width: 185,
                            child: Center(child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 18),)),
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
