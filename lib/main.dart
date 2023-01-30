import 'package:flutter/material.dart';
import 'package:learn/views/eletronics.dart';
import 'package:learn/views/furniture.dart';
import 'package:learn/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => Home(),
        '/moveis': (ctx) => Furniture(),
        '/eletronicos': (ctx) => Eletronics(),
      },
    );
  }
}
