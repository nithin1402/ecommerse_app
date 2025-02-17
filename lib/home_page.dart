import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
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

  PageController pageController = PageController();
  
  List<Widget> mPages = [
    Image.network("https://th.bing.com/th/id/OIP.8QgLZNeqWbrZug3Ade0LgQHaD5?w=318&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
    Image.network("https://th.bing.com/th/id/OIP.1xF_DfAQSD7ZAMZL4gpNwQHaEP?w=330&h=189&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
    Image.network("https://th.bing.com/th/id/OIP.s3bWa5ryx7oMLUE9-JL7OwHaDt?w=273&h=175&c=7&r=0&o=5&dpr=1.3&pid=1.7")
  ];

  int selectedIndex= -1;

  int bannerIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer.periodic(Duration(seconds: 2),(timer){
    //   if(bannerIndex>mPages.length-1){
    //     bannerIndex++;
    //   }else{
    //     bannerIndex=0;
    //   }
    //   setState(() {
    //
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
                          Text("|",style: TextStyle(fontSize: 25,color: Colors.grey),),
                          SizedBox(width: 11,),
                          Icon(Icons.list),
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
              SizedBox(
                height: 250,
                width: double.infinity,
                child: CarouselSlider.builder(itemCount: mPages.length,
                    itemBuilder: (_,index,__){
                  return mPages[index];
                }, options: CarouselOptions(
                      initialPage: 0,
                      autoPlay: true,
                      aspectRatio: 16/9,
                      autoPlayCurve: Curves.easeInOutCubicEmphasized,
                      viewportFraction: 1,
                      autoPlayAnimationDuration: Duration(milliseconds: 1000)
                    ))
                // PageView.builder(
                //   itemCount: mPages.length,
                //     controller: pageController,
                //     itemBuilder: (_,index){
                //   return mPages[index];
                // }),
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
                          InkWell(
                            onTap: (){
                              selectedIndex = index;
                              setState(() {

                              });
                    },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: selectedIndex==index ? Border.all(
                                  color: Colors.blue,
                                  width: 2
                                ) : null,
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/groce_shoes.jpg"),fit: BoxFit.cover
                                ),
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/4,crossAxisSpacing: 12,mainAxisSpacing: 12),
                  itemBuilder: (_,index) {
                    return Card(
                      elevation: 0,
                      color: Colors.grey.shade200,
                      child: Container(
                        height: 200,
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
                                        height:25,
                                          width: 25,
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
                                    height: 130,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/buds.jpg"),fit: BoxFit.fill,scale: 10
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 11,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(" Wireless Headphones",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                                        SizedBox(height: 1,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(" \$120.00",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                                  // Container(
                                  //   width: 180,
                                  //   height: 60,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                                  //   ),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     //child:
                                  //   ),
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ) ,
                      ),
                    );
                  }),


              // CurvedNavigationBar(
              //   buttonBackgroundColor: Colors.deepOrangeAccent.shade200,
              //   height: 55,
              //     onTap: (index) {
              //     if(index==3){
              //       Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
              //     }
              //     },
              //     animationDuration: Duration(milliseconds: 500),
              //     backgroundColor: Colors.white,
              //     items: [
              //   Icon(Icons.menu,color: Colors.grey.shade300,),
              //   Icon(Icons.favorite_border,color: Colors.grey.shade300),
              //   Icon(Icons.home,color: Colors.grey.shade300),
              //       Icon(Icons.shopping_cart_outlined,color: Colors.grey.shade300),
              //       Icon(Icons.person_2_outlined,color: Colors.grey.shade300)
              // ])

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 9,
        height: 65,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.menu,color: Colors.grey,),
            Icon(Icons.favorite_border,color: Colors.grey),
            SizedBox(width: 20,),
            Icon(Icons.shopping_cart_outlined,color: Colors.grey),
            Icon(Icons.person_2_outlined,color: Colors.grey)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},child: Icon(Icons.home),shape: CircleBorder(),backgroundColor: Colors.deepOrangeAccent,foregroundColor: Colors.white,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
