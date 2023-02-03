import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';
import 'package:learn/models/header/footer.dart';
import 'package:learn/models/header/header.dart';
import 'package:dio/dio.dart';
import 'package:learn/providers/shopping_cart.dart';
import 'package:provider/provider.dart';

void main() => runApp(ProductPage());

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var name = "";
  var description = "";
  var category = "";
  var image = "";
  var price = "";
  var fabric = "";
  var departament = "";
  var id = "";
  String productId = "";
  @override
  void initState() {
    super.initState();
  }

  void getListProducts() async {
    try {
      Response response = await Dio().get("http://127.0.0.1:3000/oneProduct",
          queryParameters: {"productId": productId});
      setState(() {
        name = response.data["name"];
        description = response.data["description"];
        category = response.data["category"];
        image = response.data["image"];
        price = response.data["price"];
        fabric = response.data["fabric"];
        departament = response.data["departament"];
        id = response.data["id"];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var productChoosed = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    setState(() {
      productId = productChoosed['productId'] ?? "68";
      getListProducts();
    });

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(),
          Text(productChoosed['productChoosed'] ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Image.network(
                          "https://static.vecteezy.com/ti/vetor-gratis/p3/226407-tshirt-vector-camisa-preta-gratis-vetor.jpg",
                          // width: 200,
                          // width: MediaQuery.of(context).size.width * 0.70,

                          // height: 300,
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Nome:",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(name)
                              ]),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Descrição: ",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Flexible(child: Text(description))
                              ]),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Departamento: ",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(departament)
                              ]),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Categoria: ",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(category)
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Material: ",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(fabric)
                              ]),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Preço: ",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "R\$$price",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                height: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1.0, color: Colors.blue),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "R\$$price",
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
                              context.read<ShoppingCart>().addItem(id);
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
                              'Comprar',
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
                              // Provider.of<IncController>(context, listen: false)
                              //     .incNumber(id);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        AppColors.textAddCart)),
                            child: Text(
                              'Adicionar ao Carrinho',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Footer()
        ],
      ),
    )));
  }
}
