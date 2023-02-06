import 'package:flutter/material.dart';
import 'package:learn/providers/shopping_cart.dart';
import 'package:learn/views/department.dart';
import 'package:learn/views/home.dart';
import 'package:learn/views/payment.dart';
import 'package:learn/views/search_page.dart';
import 'package:learn/views/product_page.dart';
import 'package:learn/views/user_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ShoppingCart())],
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/user',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => Home(),
        '/department': (ctx) => Department(),
        '/search': (ctx) => SearchPage(),
        '/product': (ctx) => ProductPage(),
        '/payment': (ctx) => PaymentPage(),
        '/user': (ctx) => UserPage(),
      },
    );
  }
}
