import 'package:flutter/material.dart';
import 'package:learn/controller/controllers.dart';
import 'package:learn/views/department.dart';
import 'package:learn/views/home.dart';
import 'package:learn/views/search_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => ChangeNotifierProvider(
              child: Home(),
              create: (_) => IncController(),
            ),
        '/department': (ctx) => ChangeNotifierProvider(
              child: Department(),
              create: (_) => IncController(),
            ),
        '/search': (ctx) => ChangeNotifierProvider(
              child: SearchPage(),
              create: (_) => IncController(),
            ),
      },
    );
  }
}
