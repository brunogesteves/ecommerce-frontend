import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';
import 'package:learn/models/footer.dart';
import 'package:learn/models/header/header.dart';
import 'package:learn/models/header/top_header/login_area.dart';
import 'package:dio/dio.dart';
import 'package:learn/providers/shopping_cart.dart';
import 'package:learn/providers/user_id.dart';
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
  bool isUserConnected = false;

  @override
  void initState() {
    super.initState();
    getListProducts();
  }

  void getListProducts() async {
    idItems = context.read<ShoppingCart>().shoppingCart;

    try {
      Response response = await Dio().get(
          "http://127.0.0.1:3000/user/findproducts",
          queryParameters: {"idItems": idItems});
      setState(() {
        cartProducts = response.data;
        // cartProducts2 = response.data;
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

  void sendListProducts() async {
    try {
      Response response = await Dio().post(
          "http://127.0.0.1:3000/user/sendproducts",
          queryParameters: {"values": cartProducts});
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      isUserConnected = context.watch<UserProfile>().isUserConnected;
    });

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
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: cartProducts
                                    .map(
                                      (prod) => Container(
                                        color: Colors.white,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 50,
                                                left: 60.0,
                                                bottom: 50.0),
                                            child: Row(
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      "assets/images/logotype.png"),
                                                  width: 50.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 50.0),
                                                  child: SizedBox(
                                                      width: 300.0,
                                                      child: Text(
                                                        prod["nome"].toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.amber),
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 50.0),
                                                  child: Text(
                                                      prod["preco"].toString()),
                                                ),
                                                Icon(Icons.delete)
                                              ],
                                            )),
                                      ),
                                    )
                                    .toList())
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Preco : ${finalPrice.toString()}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              height: 50.0,
                              width: 200.0,
                              child: TextButton(
                                onPressed: () {
                                  sendListProducts();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            AppColors.buttonColor)),
                                child: isUserConnected
                                    ? Text(
                                        'Fazer Pagamento',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      )
                                    : LoginDialog(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            Footer()
          ],
        ),
      ),
    )));
  }
}
