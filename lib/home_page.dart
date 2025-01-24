import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/about_product_page.dart';
import 'package:ecommerce_app/cart_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu,size: 30,),
            Icon(Icons.notifications_none_outlined,size: 30,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search...",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("|",style: TextStyle(fontSize: 25),),
                          SizedBox(width: 11,),
                          Icon(Icons.drag_handle),
                          SizedBox(width: 11,),
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45)
                    )
                ),
              ),
              SizedBox(height: 11,),
              Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:DecorationImage(
                        image: AssetImage("assets/images/exp_dis_img.png"),fit: BoxFit.fill),
                  )
              ),
              SizedBox(height: 11,),
              Container(
                height: 120,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                    itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/groce_shoes.jpg"),fit: BoxFit.cover
                              ),
                            ),
                          ),
                          SizedBox(height: 11,),
                          Text("Shoes",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    );
                    }),
              ),
              SizedBox(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special For You",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  Text("See all",style: TextStyle(color: Colors.grey),)
                ],
              ),
              Container(
                height: 290,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3),
                    itemBuilder: (_,index) {
                      return Card(
                        elevation: 4,
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutProductPage()));
                            },
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height:30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.deepOrangeAccent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                                            ),
                                            child: Icon(Icons.favorite_border,color: Colors.grey.shade300,size: 20,)
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 1,),
                                    Container(
                                      height: 155,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                          image: DecorationImage(
                                              image: AssetImage("assets/images/buds.jpg"),fit: BoxFit.fill,scale: 10
                                          )
                                      ),
                                    ),
                                    Container(
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 11,),
                                            Text("Wireless Headphones",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 11,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("\$120.00",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                                SizedBox(
                                                  height: 21,
                                                  width: 65,
                                                  child: ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: productColors.length,
                                                      itemBuilder: (_,index) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Container(
                                                            height: 17,
                                                            width: 17,
                                                            decoration: BoxDecoration(
                                                                color: productColors[index],
                                                                borderRadius: BorderRadius.circular(40)
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            )

                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ) ,
                        ),
                      );
                    }),
              ),
              CurvedNavigationBar(
                buttonBackgroundColor: Colors.deepOrangeAccent.shade200,
                height: 55,
                  onTap: (index) {
                  if(index==3){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                  }
                  },
                  animationDuration: Duration(milliseconds: 500),
                  backgroundColor: Colors.white,
                  items: [
                Icon(Icons.menu,color: Colors.grey.shade300,),
                Icon(Icons.favorite_border,color: Colors.grey.shade300),
                Icon(Icons.home,color: Colors.grey.shade300),
                    Icon(Icons.shopping_cart_outlined,color: Colors.grey.shade300),
                    Icon(Icons.person_2_outlined,color: Colors.grey.shade300)
              ])

            ],
          ),
        ),
      ),
    );
  }
}
