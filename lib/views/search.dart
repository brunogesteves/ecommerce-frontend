import 'package:flutter/material.dart';
import 'package:learn/models/header/header.dart';
import 'package:learn/models/carousel.dart';
import 'package:learn/models/list_products.dart';

void main() => runApp(Search());

class Search extends StatelessWidget {
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
          ]),
    )));
  }
}
