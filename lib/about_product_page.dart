import 'package:ecommerce_app/cart_page.dart';
import 'package:flutter/material.dart';

class AboutProductPage extends StatefulWidget {
  const AboutProductPage({super.key});

  @override
  State<AboutProductPage> createState() => _AboutProductPageState();
}

class _AboutProductPageState extends State<AboutProductPage> {

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
                      image: AssetImage("assets/images/buds.jpg"),fit: BoxFit.fill
                    )
                  ),
                ),
                SizedBox(height: 21,),
                Text("Wireless Headphone",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 11,),
                Text("\$520.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 11,),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        width: 60,
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
                    ),
                    SizedBox(width: 11,),
                    Text("(320 reviews)",style: TextStyle(color: Colors.grey),),
                    Expanded(
                      flex: 1,
                        child: SizedBox(width: 5,)),
                    Expanded(
                        flex:6,
                        child: Text("Seller: Tariqul islam",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
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
          Padding(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("-",style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text("1",style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text("+",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 1
                              )
                            ]
                        ),
                      ),
                      SizedBox(width: 11,),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
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
        ]
      ),
    );
  }
}
