import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';
import 'package:learn/models/app_styles.dart';

import '../views/eletronics.dart';
import '../views/furniture.dart';

void main() => runApp(Menu());

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            child: Text("Eletronícos"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Eletronics()),
              );
            },
          ),
          Text(
            'Moveis',
            style: ralewayStyle.copyWith(
              fontSize: 12.0,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          ElevatedButton(
            child: Text("Moveis"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Furniture()),
              );
            },
          ),
          Text(
            'Admin',
            style: ralewayStyle.copyWith(
              fontSize: 12.0,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage("assets/images/car_market.png"),
            ),
          ),
        ],
      ),
    );
  }
}
