import 'package:flutter/material.dart';
import 'package:learn/views/app_colors.dart';
import 'package:learn/views/app_styles.dart';

void main() => runApp(Menu());

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlueAccent,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Admin',
              style: ralewayStyle.copyWith(
                fontSize: 12.0,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Admin',
              style: ralewayStyle.copyWith(
                fontSize: 12.0,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Admin',
              style: ralewayStyle.copyWith(
                fontSize: 12.0,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Admin',
              style: ralewayStyle.copyWith(
                fontSize: 12.0,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ));
  }
}
