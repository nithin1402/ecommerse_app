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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage("assets/images/buds.jpg"),fit: BoxFit.fill
                  )
                ),
              ),
              SizedBox(height: 21,),
              Text("Wireless Headphone",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              SizedBox(height: 11,),
              Text("\$520.00",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Text("Seller: Tariqul islam",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                ],
              ),
              SizedBox(height: 11,),
              Text("Color",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                  Text("Description",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Text("Specifications",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  Text("Reviews",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CartPage()));
      },child: Icon(Icons.add),),
    );
  }
}
