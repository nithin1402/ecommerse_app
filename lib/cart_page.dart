import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             Container(
               height: 500,
               child: ListView.builder(
                   itemCount: 5,
                   itemBuilder: (_,index){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 120,
                     width: double.infinity,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(15),
                         boxShadow: [
                           BoxShadow(
                               color: Colors.grey.shade200,
                               spreadRadius: 3,
                               blurRadius: 2
                           )
                         ]
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           Expanded(
                             flex: 1,
                             child: Container(
                               height: 70,
                               width: 70,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   image: DecorationImage(
                                       image: AssetImage("assets/images/buds.jpg")
                                   )
                               ),
                             ),
                           ),
                           SizedBox(width: 11,),
                           Expanded(
                             flex: 3,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("Wireless Headphone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                     Icon(Icons.delete_sharp,color: Colors.redAccent,)
                                   ],
                                 ),
                                 Text("Electronics",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                 SizedBox(height: 11,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("\$120.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                     Row(
                                       children: [
                                         Container(
                                           height: 30,
                                           width: 30,
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.horizontal(left: Radius.circular(20))
                                           ),
                                           child: Center(child: Text("-",style: TextStyle(fontSize:22,fontWeight: FontWeight.bold),)),
                                         ),
                                         Container(
                                           height: 30,
                                           width: 30,
                                           decoration: BoxDecoration(
                                             color: Colors.grey.shade300,
                                           ),
                                           child: Center(child: Text("1",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                                         ),
                                         Container(
                                           height: 30,
                                           width: 30,
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.horizontal(right: Radius.circular(20))
                                           ),
                                           child: Center(child: Text("+",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                                         ),
                                       ],
                                     )
                                   ],
                                 )
                               ],
                             ),
                           ),
                           SizedBox(width: 11,),

                         ],
                       ),
                     ),
                   ),
                 );
               }),
             )
            ],
          ),
        ),
      ),
    );
  }
}
