import 'package:flutter/material.dart';
import 'package:learn/providers/shopping_cart.dart';
import 'package:learn/providers/user_id.dart';
import 'package:learn/providers/search_provider.dart';
import 'package:learn/providers/product_provider.dart';
import 'package:learn/views/department.dart';
import 'package:learn/views/home.dart';
import 'package:learn/views/payment.dart';
import 'package:learn/views/search_page.dart';
import 'package:learn/views/product_page.dart';
import 'package:learn/views/user_page.dart';
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
