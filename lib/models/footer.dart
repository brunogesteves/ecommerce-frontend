import 'package:flutter/material.dart';
import 'package:ecommerce/models/app_colors.dart';

void main() => runApp(Footer());

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.headerBackGround,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("E-Commerce todos os Direitos Reservados"),
          ),
        ));
  }
}
