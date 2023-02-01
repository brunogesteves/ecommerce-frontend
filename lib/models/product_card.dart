import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';
// import 'package:learn/views/app_styles.dart';

class ProductCard extends StatelessWidget {
  final String nameProduct;
  final String fileImage;
  final String price;
  final String description;
  const ProductCard(
      {Key? key,
      required this.nameProduct,
      required this.fileImage,
      required this.description,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.0,
      width: 250.0,
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
              child: Image.network(
                fileImage,
                width: 200,
                // height: 300,
                // fit: BoxFit.fill,
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      nameProduct,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 25.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      description,
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                child: Text(
                  price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                      fontSize: 25.0),
                ),
              ),
            ),
            Container(
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
                        color: Colors.white,
                        fontSize: 25.0),
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
