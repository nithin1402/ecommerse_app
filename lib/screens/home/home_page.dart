import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/screens/home/about_product_page.dart';
import 'package:ecommerce_app/screens/home/cart_page.dart';
import 'package:ecommerce_app/screens/home/personal_details_page.dart';
import 'package:ecommerce_app/screens/product_bloc/product_bloc.dart';
import 'package:ecommerce_app/screens/product_bloc/product_event.dart';
import 'package:ecommerce_app/screens/product_bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel>? productModel;

  List<Widget> mPage = [
    CartPage(),
  ];

  List<Color> productColors = [
    Colors.redAccent,
    Colors.black,
    Colors.blue,
    Colors.brown,
    Colors.grey,
  ];

  PageController pageController = PageController();

  List<Widget> mPages = [
    Image.network(
        "https://th.bing.com/th/id/OIP.8QgLZNeqWbrZug3Ade0LgQHaD5?w=318&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
    Image.network(
        "https://th.bing.com/th/id/OIP.1xF_DfAQSD7ZAMZL4gpNwQHaEP?w=330&h=189&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
    Image.network(
        "https://th.bing.com/th/id/OIP.s3bWa5ryx7oMLUE9-JL7OwHaDt?w=273&h=175&c=7&r=0&o=5&dpr=1.3&pid=1.7")
  ];
  
  List<String> categoryImages = [
    "https://th.bing.com/th/id/OIP.78nYHr1T7Yv-AxU2LWiH7QHaHa?w=185&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.0vG8_FUIhejk5KJNExa-ZgHaHa?w=182&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.sjrPMAPzf-Wh1QZb4JgojAHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.ddA6jwRNuEAGZoiIvYjjgQHaHa?w=186&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.-rD7PqeX7Vp_43bP-al0SwHaJh?w=149&h=192&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.nU6GcWu6iBGBs86qfCcI-wHaJy?w=145&h=192&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.evOPcuXk5KxWuVoxUbWIPgHaHa?w=166&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.d8Xow2XpRSLqyhJwyaE9tQHaHa?w=202&h=202&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.Sh0ME4v4Sow4BeNtZoeqygHaHa?w=218&h=218&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.nErRM6XdMr4WIJMikB4NvQHaHa?w=186&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7"

  ];

  List<String> categoryNames = [
    "Shoes",
    "Mobiles",
    "Sunglass",
    "Jeans",
    "Shirts",
    "Watch",
    "Tv",
    "Laptop",
    "Earbuds",
    "Perfumes"
  ];

  int selectedIndex = -1;

  int bottomSelectedIndex = 2;

  int bannerIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(FetchProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              size: 30,
            ),
            Icon(
              Icons.notifications_none_outlined,
              size: 30,
            )
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
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "|",
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Icon(Icons.list),
                          SizedBox(
                            width: 11,
                          ),
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45))),
              ),
              SizedBox(
                height: 11,
              ),
              SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                      itemCount: mPages.length,
                      itemBuilder: (_, index, __) {
                        return mPages[index];
                      },
                      options: CarouselOptions(
                          initialPage: 0,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.easeInOutCubicEmphasized,
                          viewportFraction: 1,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1000)))
                  // PageView.builder(
                  //   itemCount: mPages.length,
                  //     controller: pageController,
                  //     itemBuilder: (_,index){
                  //   return mPages[index];
                  // }),
                  ),
              SizedBox(
                height: 11,
              ),
            Container(
        height: 120,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryImages.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          border: selectedIndex == index
                              ? Border.all(color: Colors.blue, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: NetworkImage(categoryImages[index]),fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                       categoryNames[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }),
      ),
              SizedBox(
                height: 11,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state is ProductLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoadedState) {
                  return SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.mProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            childAspectRatio: 2 / 3),
                        itemBuilder: (_, index) {
                          return Card(
                            elevation: 0,
                            color: Colors.grey.shade200,
                            child: Container(
                              height: 200,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AboutProductPage(selectedProduct: state.mProducts[index],)));
                                },
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomLeft: Radius
                                                                .circular(10))),
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.grey.shade300,
                                                  size: 20,
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Container(
                                          height: 130,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(15)),
                                              image: DecorationImage(
                                                  image:state.mProducts[index].image!=null ? NetworkImage(state.mProducts[index].image) : AssetImage("assets/images/buds.jpg"),
                                                  //AssetImage("assets/images/buds.jpg"),
                                                  fit: BoxFit.contain,
                                                  scale: 10)) ,
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(state.mProducts[index].name ?? "",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                              state.mProducts[index].price ?? "0.00",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 21,
                                                    width: 65,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: productColors
                                                            .length,
                                                        itemBuilder:
                                                            (_, index) {
                                                          return Padding(
                                                            padding:const EdgeInsets.all(2.0),child: Container(
                                                              height: 17,
                                                              width: 17,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      productColors[
                                                                          index],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40)),
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
                              ),
                            ),
                          );
                        }),
                  );
                }

                if (state is ProductErrorState) {
                  return Center(
                    child: Text(state.errorMsg),
                  );
                }
                return Container();
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
            Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            Icon(Icons.favorite_border, color: Colors.grey),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
              },
                child: Icon(Icons.shopping_cart_outlined, color: Colors.grey)),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetailsPage()));
                },
                child: Icon(Icons.person_2_outlined, color: Colors.grey))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home),
        shape: CircleBorder(),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
