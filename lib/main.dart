
import 'package:ecommerce_app/data/remote/api_helper.dart';
import 'package:ecommerce_app/data/repository/app_repository.dart';
import 'package:ecommerce_app/screens/add_cart_bloc/addcart_bloc.dart';
import 'package:ecommerce_app/screens/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_app/screens/bloc/home_bloc.dart';
import 'package:ecommerce_app/screens/on_boarding/login_page.dart';
import 'package:ecommerce_app/screens/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/home_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create:(context)=>HomeBloc(appRepository: AppRepository(apiHelper: ApiHelper())),),
    BlocProvider(create:(context)=>ProductBloc(apiHelper: ApiHelper())),
    BlocProvider(create:(context)=>AddcartBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context)=>CartBloc(apiHelper: ApiHelper()))
    ],
    child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage()
    );
  }
}

