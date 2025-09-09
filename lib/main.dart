import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/cart_cubit.dart';
import 'core/cubit/product_cubit.dart';
import 'presentation/screens/screens.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CartCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => ProductCubit()..loadProducts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeScreen(),
          "/cart": (context) => const CartScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == "/productDetails") {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(product: args['product']),
            );
          }
          return null;
        },
      ),
    );
  }
}
