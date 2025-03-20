import 'package:ecommerce_app/screens/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_app/screens/bloc/cart_bloc/cart_event.dart';
import 'package:ecommerce_app/screens/bloc/cart_bloc/cart_state.dart';
import 'package:ecommerce_app/screens/bloc/create_order_bloc/create_order_bloc.dart';
import 'package:ecommerce_app/screens/bloc/decrement_bloc/decrement_count_bloc.dart';
import 'package:ecommerce_app/screens/bloc/decrement_bloc/decrement_count_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_model.dart';
import '../bloc/create_order_bloc/create_order_event.dart';
import '../bloc/create_order_bloc/create_order_state.dart';
import '../bloc/decrement_bloc/decrement_count_event.dart';

class CartPage extends StatefulWidget {
  DataModel? selectedProduct;
  CartPage({Key? key, this.selectedProduct}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int qyt = 1;
  bool isLoading = false;
  num price = 0;
  num toatalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(FetchCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CartLoadedState) {
                      return ListView.builder(
                          itemCount: state.cartData.length,
                          itemBuilder: (_, index) {
                            price=state.cartData[index].quantity*int.parse(state.cartData[index].price);
                            print(price);
                            toatalPrice+=price;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                          blurRadius: 2)
                                    ]),
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: NetworkImage(state
                                                      .cartData[index].image)
                                                  //AssetImage("assets/images/buds.jpg")
                                                  )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  state.cartData[index].name,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Icon(
                                                  Icons.delete_outlined,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                )
                                              ],
                                            ),
                                            Text(
                                              state.cartData[index].name,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    state.cartData[index]
                                                        .price,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                BlocListener<DecrementCountBloc, DecrementCountState>(
                                                  listener: (context, state) {
                                                  if(state is DecrementCountErrorState){
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                                                  }
                                                  if(state is DecrementCountLoadedState){
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product removed from cart")));
                                                  }
                                                }, child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                       context.read<DecrementCountBloc>().add(DecrementCountEvent(
                                                           bodyParams: {
                                                             "product_id": state.cartData[index].id,
                                                             "quantity": state.cartData[index].quantity
                                                       }));
                                                       setState(() {

                                                       });
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey
                                                                .shade200,
                                                            borderRadius: BorderRadius
                                                                .horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            20))),
                                                        child: Center(
                                                            child: Text(
                                                          "-",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        )),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration:
                                                          BoxDecoration(
                                                        color: Colors
                                                            .grey.shade200,
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        state.cartData[index].quantity.toString(),

                                                        style: TextStyle(
                                                          fontSize: 18,
                                                        ),
                                                      )),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                       state.cartData[index].quantity+1;
                                                       setState(() {

                                                       });
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey
                                                                .shade200,
                                                            borderRadius: BorderRadius
                                                                .horizontal(
                                                                    right: Radius
                                                                        .circular(
                                                                            20))),
                                                        child: Center(
                                                            child: Text(
                                                          "+",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          ),
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    if (state is CartErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    }
                    return Container(
                      child: Center(
                        child: Text("No Data"),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            BlocListener<CreateOrderBloc, CreateOrderState>(
              listener: (context, state) {
                if (state is CreateOrderLoadingState) {
                  isLoading = true;
                  setState(() {});
                }
                if (state is CreateOrderErrorState) {
                  isLoading = false;
                  setState(() {});
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.errorMsg)));
                }
                if (state is CreateOrderLoadedState) {
                  isLoading = false;
                  setState(() {});
                }
              },
              child: Expanded(
                child: Container(
                  height: 280,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(35)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 1, spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 11,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Enter Discount Code",
                              suffix: Text(
                                "Apply",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35))),
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            Text(
                              "${price.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "${toatalPrice.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                context.read<CreateOrderBloc>().add(CreateOrderEventStarted(
                  bodyParameters: {
                    "product_id": widget.selectedProduct!.id,
                  },
                ));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Placed Successfully")));
    },
              child: Container(
                height: 55,
                width: 380,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(35)),
                child: Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
