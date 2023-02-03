import 'package:flutter/material.dart';
import 'package:learn/models/header/footer.dart';
import 'package:learn/models/header/header.dart';
import 'package:dio/dio.dart';
import 'package:learn/providers/shopping_cart.dart';
// import 'package:learn/models/app_colors.dart';
import 'package:provider/provider.dart';

void main() => runApp(PaymentPage());

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<dynamic> productsFromUniqueDepartment = [];
  String searchTerm = "Computers";
  @override
  void initState() {
    super.initState();
  }

  void getListProducts() async {
    try {
      Response response = await Dio().get("http://127.0.0.1:3000/search",
          queryParameters: {"searchTerm": searchTerm});
      setState(() {
        productsFromUniqueDepartment = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var searchChoosed = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    setState(() {
      searchTerm = searchChoosed['searchChoosed'] ?? "";
      getListProducts();
    });
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(),
          // Footer()
        ],
      ),
    )));
  }
}
