import 'package:flutter/material.dart';
import 'package:learn/models/footer.dart';
import 'package:learn/models/header/header.dart';
import 'package:dio/dio.dart';
import 'package:learn/models/product_card.dart';

void main() => runApp(SearchPage());

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      child: Scrollbar(
        child: Column(
          children: <Widget>[
            Header(),
            Text(searchChoosed['searchChoosed'] ?? ""),
            productsFromUniqueDepartment.isEmpty
                ? Text("faça uma busca")
                : Wrap(
                    children: productsFromUniqueDepartment
                        .map((prod) => ProductCard(
                            nameProduct: prod["nome"],
                            fileImage:
                                "https://static.vecteezy.com/ti/vetor-gratis/p3/226407-tshirt-vector-camisa-preta-gratis-vetor.jpg",
                            description: prod["descricao"],
                            id: prod["id"],
                            price: prod["preco"]))
                        .toList()),
            Footer()
          ],
        ),
      ),
    )));
  }
}
