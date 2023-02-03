import 'package:flutter/material.dart';
import 'package:learn/models/product_card.dart';
import 'package:dio/dio.dart';

void main() => runApp(const ListProducts());

class ListProducts extends StatefulWidget {
  const ListProducts({super.key});

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  List<dynamic> frontProducts = [];
  @override
  void initState() {
    getListProducts(); //fetching data
    super.initState();
  }

  void getListProducts() async {
    try {
      Response response =
          await Dio().get("http://127.0.0.1:3000/frontproducts");
      setState(() {
        frontProducts = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(20),
      child: Wrap(
          children: frontProducts
              .map((prod) => ProductCard(
                  nameProduct: prod["nome"],
                  fileImage:
                      "https://static.vecteezy.com/ti/vetor-gratis/p3/226407-tshirt-vector-camisa-preta-gratis-vetor.jpg",
                  description: prod["descricao"],
                  id: prod["id"],
                  price: prod["preco"]))
              .toList()),
    );
  }
}
