import 'package:flutter/material.dart';
import 'package:learn/views/list_products.dart';
import 'package:learn/views/menu.dart';
import 'package:learn/views/carousel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
              Menu(),
              Carousel(),
              ListProducts(),
            ]))));
  }
}
