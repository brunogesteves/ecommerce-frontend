import 'package:flutter/material.dart';
import 'package:ecommerce/models/carousel.dart';
import 'package:ecommerce/models/footer.dart';
import 'package:ecommerce/models/header/header.dart';
import 'package:ecommerce/models/list_products.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Scrollbar(
        thumbVisibility: true,
        thickness: 200.0,
        trackVisibility: true,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Header(), Carousel(), ListProducts(), Footer()]),
      ),
    )));
  }
}
