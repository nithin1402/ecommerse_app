import 'package:ecommerce_app/screens/bloc/get_order_bloc/get_order_bloc.dart';
import 'package:ecommerce_app/screens/bloc/get_order_bloc/get_order_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/orders_model.dart';
import '../bloc/get_order_bloc/get_order_state.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetOrderBloc>().add(FetchOrderEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
        centerTitle: true,
      ),
      body: BlocBuilder<GetOrderBloc, GetOrderState>(
        builder: (context, state) {
          if (state is GetOrderLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetOrderErrorState) {
            return Center(child: Text(state.errorMsg));
          } else if (state is GetOrderLoadedState) {
            var orders = state.getOrderModel.orders;

            if (orders == null || orders.isEmpty) {
              return Center(child: Text("No orders found"));
            }

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, orderIndex) {
                var order = orders[orderIndex];

                if (order.product == null || order.product!.isEmpty) {
                  return ListTile(
                    title: Text("No products in this order"),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Order ${orderIndex + 1}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...order.product!.map((product) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(product.image ?? ""),
                        ),
                        title: Text(product.name ?? "Unknown Product"),
                        subtitle: Text(product.price ?? "Price not available"),
                      );
                    }).toList(),
                    Divider(),
                  ],
                );
              },
            );
          }
          return Center(child: Text("Unexpected error occurred"));
        },
      ),
    );
  }
}
