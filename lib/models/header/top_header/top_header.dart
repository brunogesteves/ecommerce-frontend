import 'package:flutter/material.dart';
import 'package:learn/models/header/top_header/input_search.dart';
import 'package:learn/models/header/top_header/login_area.dart';
import 'package:learn/models/header/top_header/logotype.dart';
import 'package:learn/models/app_colors.dart';
import 'package:learn/models/header/top_header/shopping_cart_header.dart';

void main() => runApp(TopHeader());

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.headerBackGround,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Logotype(),
            InputSearch(),
            ShoppingCartIcom(),
            LoginArea()
          ],
        ));
  }
}
