import 'package:flutter/material.dart';
import 'package:learn/models/header/header.dart';

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
            Header(),
            // Carousel(),
            // ListProducts(),
          ]),
    )));
  }
}
