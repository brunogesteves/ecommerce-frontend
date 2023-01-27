import 'package:flutter/material.dart';
import 'package:learn/views/app_colors.dart';
import 'package:learn/views/product_card.dart';
// import 'package:learn/views/product_card.dart';
// import 'package:learn/views/app_colors.dart';
// import 'package:learn/views/product_card.dart';

void main() => runApp(ListProducts());

class ListProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: AppColors.blueDarkColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProductCard(
            nameProduct: "Apple Macbook Aire 13 ",
            fileImage: 'assets/images/notebook.png',
            InfoProduct: "Informação do Produto",
            Price: 'R\$25000,00',
          ),
          ProductCard(
            nameProduct: "Apple Macbook Aire 13 ",
            fileImage: 'assets/images/notebook.png',
            InfoProduct: "Informação do Produto",
            Price: 'R\$25000,00',
          ),
          ProductCard(
            nameProduct: "Apple Macbook Aire 13 ",
            fileImage: 'assets/images/notebook.png',
            InfoProduct: "Informação do Produto",
            Price: 'R\$25000,00',
          ),
        ],
      ),
    );
  }
}
