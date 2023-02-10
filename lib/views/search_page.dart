import 'package:flutter/material.dart';
import 'package:ecommerce/models/footer.dart';
import 'package:ecommerce/models/header/header.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/models/product_card.dart';
import 'package:ecommerce/providers/search_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(SearchPage());

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResults = [];
  String searchTerm = "";
  var n = 0;

  @override
  void initState() {
    super.initState();
    context.read<SearchProvider>().resetSearch(1);
  }

  hasSearchTerm() {
    if (searchTerm == "") {
      Navigator.pushNamed(
        context,
        '/',
      );
    } else {
      getListProducts();
    }
  }

  void getListProducts() async {
    try {
      Response response = await Dio().get("http://127.0.0.1:3000/search",
          queryParameters: {"searchTerm": searchTerm});
      setState(() {
        searchResults = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      searchTerm = context.read<SearchProvider>().searchTerm;
    });

    while (context.read<SearchProvider>().searchtime != 0) {
      hasSearchTerm();
      context.read<SearchProvider>().resetSearch(0);
    }

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Scrollbar(
        child: Column(
          children: <Widget>[
            Header(),
            searchResults.isEmpty
                ? CircularProgressIndicator(
                    semanticsLabel: 'Carregando',
                  )
                : Wrap(
                    children: searchResults
                        .map((prod) => ProductCard(
                            nameProduct: prod["nome"],
                            fileImage: prod["imagem"],
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
