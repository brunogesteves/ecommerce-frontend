import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';
// import 'package:learn/views/app_styles.dart';

class ProductCard extends StatelessWidget {
  final String nameProduct;
  final String fileImage;
  final String InfoProduct;
  final String Price;
  const ProductCard(
      {Key? key,
      required this.nameProduct,
      required this.fileImage,
      required this.InfoProduct,
      required this.Price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0,
      width: 300.0,
      child: Card(
        color: AppColors.backColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.asset(
                fileImage,
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              title: Text(
                nameProduct,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    fontSize: 25.0),
              ),
              subtitle: Text(
                InfoProduct,
                style: TextStyle(color: AppColors.textColor, fontSize: 20.0),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                child: Text(
                  Price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                      fontSize: 25.0),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50.0,
                  width: 290.0,
                  child: TextButton(
                    onPressed: () {
                      print("ok");
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            AppColors.mainBlueColor)),
                    child: Text(
                      'Comprar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                          fontSize: 25.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
