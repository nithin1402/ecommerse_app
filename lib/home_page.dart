import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.category),
            Icon(Icons.notifications)
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
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
                height: 500,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: 5,
                  itemBuilder: (_,index) {
                    return  Container(
                      height: 600,
                      width: 200,
                      child: Column(
                        children: [
                          Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey,
                                //     blurRadius: 1,
                                //     spreadRadius: 1
                                //   )
                                // ],
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/buds.jpg")
                                  )
                              )
                          ),
                          SizedBox(height: 11,),
                          Text("Wireless Headphones",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 11,),
                          Text("120.00",style: TextStyle(fontSize: 12),)
                        ],
                      ) ,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
