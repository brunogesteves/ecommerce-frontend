import 'package:flutter/material.dart';
import 'package:ecommerce/models/app_colors.dart';
import 'package:ecommerce/models/footer.dart';
import 'package:ecommerce/models/header/header.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/providers/shopping_cart.dart';
import 'package:provider/provider.dart';

void main() => runApp(ProductPage());

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Map<String, dynamic> productContent = {};
  String productId = "";

  @override
  void initState() {
    super.initState();
    getListProducts();
  }

  void getListProducts() async {
    productId = context.read<ProductProvider>().productId;

    try {
      Response response = await Dio().get("http://127.0.0.1:3000/oneProduct",
          queryParameters: {"productId": productId});
      setState(() {
        productContent = response.data;
        productId = response.data["id"];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Scrollbar(
        child: Column(
          children: [
            Header(),
            productContent.isEmpty
                ? CircularProgressIndicator(
                    semanticsLabel: 'Carregando',
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.network(
                                  productContent["image"],
                                  // width: 200,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Nome: ",
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(productContent["name"] ?? "")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Descrição: ",
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                              productContent["description"] ??
                                                  ""),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Categoria: ",
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(productContent["category"] ?? "")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Preço: ",
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(productContent["price"] ?? "")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Material: ",
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(productContent["fabric"] ?? "")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Departamento: ",
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            productContent["departament"] ?? "")
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      width: 1.0, color: Colors.blue),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "R\$${productContent["price"]}",
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 290.0,
                                    child: TextButton(
                                      onPressed: () {
                                        if (!context
                                            .read<ShoppingCart>()
                                            .shoppingCart
                                            .contains(productContent["id"])) {
                                          context
                                              .read<ShoppingCart>()
                                              .addItem(productContent["id"]);
                                        }
                                        Navigator.pushNamed(
                                          context,
                                          '/payment',
                                        );
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  AppColors.textBuyButton)),
                                      child: Text(
                                        context
                                                .read<ShoppingCart>()
                                                .shoppingCart
                                                .contains(productContent["id"])
                                            ? 'Pagar'
                                            : 'Comprar',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                      height: 40.0,
                                      width: 290.0,
                                      child: TextButton(
                                        onPressed: () {
                                          if (!context
                                              .read<ShoppingCart>()
                                              .shoppingCart
                                              .contains(productContent["id"])) {
                                            context
                                                .read<ShoppingCart>()
                                                .addItem(productContent["id"]);
                                          }
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Color.fromARGB(
                                                        255, 141, 136, 103))),
                                        child: Text(
                                          context
                                                  .read<ShoppingCart>()
                                                  .shoppingCart
                                                  .contains(
                                                      productContent["id"])
                                              ? 'Produto já adicionado'
                                              : 'Adicionar ao Carrinho',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 12.0),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
            Footer()
          ],
        ),
      ),
    )));
  }
}
