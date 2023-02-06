import 'package:flutter/material.dart';
import 'package:learn/providers/shopping_cart.dart';
import 'package:provider/provider.dart';

class ShoppingCartIcom extends StatelessWidget {
  const ShoppingCartIcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: SizedBox(
          width: 70,
          height: 40,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/payment',
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset("../assets/images/car_market.png",
                    width: 10.0, color: Colors.black),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 300.0,
                    padding: EdgeInsets.only(left: 55.0),
                    child: Text(
                      context.watch<ShoppingCart>().shoppingCartQty.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
