import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vapestore/data/datasources/product_remote_datasource.dart';
import 'package:vapestore/bloc/login/login_bloc.dart';
import 'package:vapestore/data/datasources/auth_remote_datasource.dart';
import 'package:vapestore/presentation/home/home_page.dart';

import 'bloc/checkout/checkout_bloc.dart';
import 'bloc/get_products/get_products_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductsBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 254, 254, 254)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
