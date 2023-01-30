import 'package:flutter/material.dart';
import 'package:learn/models/menu.dart';
import 'package:learn/models/carousel.dart';
import 'package:learn/models/list_products.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Menu(),
            // Carousel(),
            // ListProducts(),
            // ListProducts(),
            // ListProducts(),
            // ListProducts(),
          ]),
    )));
  }
}
