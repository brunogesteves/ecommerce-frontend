import 'package:flutter/material.dart';
import 'package:learn/models/footer.dart';
import 'package:learn/models/header/header.dart';
import 'package:dio/dio.dart';
import 'package:learn/providers/shopping_cart.dart';
import 'package:provider/provider.dart';

void main() => runApp(PaymentPage());

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<dynamic> cartProducts = [];
  List<String> idItems = [];
  double finalPrice = 0;
  int i = 0;

  @override
  void initState() {
    super.initState();
    getListProducts();
  }

  void getListProducts() async {
    idItems = context.read<ShoppingCart>().shoppingCart;
    // print(idItems);
    print(idItems.length);

    try {
      Response response = await Dio().get(
          "http://127.0.0.1:3000/user/findproducts",
          queryParameters: {"idItems": idItems});
      setState(() {
        cartProducts = response.data;
      });
      while (i < cartProducts.length - 1) {
        finalPrice += double.parse(cartProducts[i]["preco"]);
        i++;
        if (i == cartProducts.length - 1) {
          break;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    print(context.read<ShoppingCart>().shoppingCart);

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Scrollbar(
        child: Column(
          children: <Widget>[
            Header(),
            Text(context.watch<ShoppingCart>().shoppingCart.toString()),
            cartProducts.isEmpty
                ? Text("Carregando")
                : ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                          children: cartProducts
                              .map((prod) => Center(
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50, left: 60.0),
                                        child: Row(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  "assets/images/logotype.png"),
                                              width: 50.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50.0),
                                              child: SizedBox(
                                                  width: 300.0,
                                                  child: Text(
                                                    prod["nome"].toString(),
                                                    style: TextStyle(
                                                        color: Colors.amber),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 50.0),
                                              child: Text(
                                                  prod["preco"].toString()),
                                            ),
                                            Icon(Icons.delete)
                                          ],
                                        )),
                                  ))
                              .toList())
                    ],
                  ),
            Text("Preco : ${finalPrice.toString()}"),
            TextButton(
              onPressed: () {
                getListProducts();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 0, 250, 8))),
              child: Text(
                'Fazer Pagamento',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12.0),
              ),
            ),
            Footer()
          ],
        ),
      ),
    )));
  }
}
