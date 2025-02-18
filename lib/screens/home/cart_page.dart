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
      body: Stack(
        children: [
          Column(
          children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 400,
               child: ListView.builder(
                   itemCount: 3,
                   itemBuilder: (_,index){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Expanded(
                     child: Container(
                       height: 100,
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
                                       Text("Wireless Headphone",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                       Icon(Icons.delete_outlined,color: Colors.deepOrangeAccent,)
                                     ],
                                   ),
                                   Text("Electronics",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("\$120.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                       Row(
                                         children: [
                                           Container(
                                             height: 30,
                                             width: 30,
                                             decoration: BoxDecoration(
                                                 color: Colors.grey.shade200,
                                                 borderRadius: BorderRadius.horizontal(left: Radius.circular(20))
                                             ),
                                             child: Center(child: Text("-",style: TextStyle(fontSize:20),)),
                                           ),
                                           Container(
                                             height: 30,
                                             width: 30,
                                             decoration: BoxDecoration(
                                               color: Colors.grey.shade200,
                                             ),
                                             child: Center(child: Text("1",style: TextStyle(fontSize: 18,),)),
                                           ),
                                           Container(
                                             height: 30,
                                             width: 30,
                                             decoration: BoxDecoration(
                                                 color: Colors.grey.shade200,
                                                 borderRadius: BorderRadius.horizontal(right: Radius.circular(20))
                                             ),
                                             child: Center(child: Text("+",style: TextStyle(fontSize: 18,),)),
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
                   ),
                 );
               }),
             ),
           ),
            SizedBox(height: 11,),
            Expanded(
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      spreadRadius: 1
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(height: 11,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Discount Code",
                          suffix: Text("Apply",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35)
                          )
                        ),
                      ),
                      SizedBox(height: 21,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal",style: TextStyle(color: Colors.grey,fontSize: 18),),
                          Text("\$245.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                        ],
                      ),
                      SizedBox(height: 11,),
                      Container(
                        height: 1,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 11,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
                          Text("\$245.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                width: 380,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(35)
                ),
                child: Center(
                  child: Text("Checkout",style: TextStyle(fontSize: 19,color: Colors.white),),
                ),
              ),
            ),
          ),
    ]
      ),
    );
  }
}
