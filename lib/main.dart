import 'package:flutter/material.dart';
import 'package:ecommerce/providers/shopping_cart.dart';
import 'package:ecommerce/providers/user_id.dart';
import 'package:ecommerce/providers/search_provider.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/views/department.dart';
import 'package:ecommerce/views/home.dart';
import 'package:ecommerce/views/payment.dart';
import 'package:ecommerce/views/search_page.dart';
import 'package:ecommerce/views/product_page.dart';
import 'package:ecommerce/views/user_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ShoppingCart()),
      ChangeNotifierProvider(create: (_) => UserProfile()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => Home(),
        '/department': (ctx) => Department(),
        '/search': (ctx) => SearchPage(),
        '/product': (ctx) => ProductPage(),
        '/payment': (ctx) => PaymentPage(),
        '/user': (ctx) => User(),
      },
    );
  }
}
