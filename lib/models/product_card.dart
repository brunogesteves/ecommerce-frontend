import 'package:flutter/material.dart';
import 'package:ecommerce/models/app_colors.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:provider/provider.dart';
// import 'package:ecommerce/views/app_styles.dart';

class ProductCard extends StatelessWidget {
  final String nameProduct;
  final String fileImage;
  final String price;
  final String description;
  final String id;
  const ProductCard(
      {Key? key,
      required this.nameProduct,
      required this.fileImage,
      required this.description,
      required this.id,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void changeScreen(id) {
      context.read<ProductProvider>().addProductId(id);
      Navigator.pushNamed(
        context,
        '/product',
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        // height: 500.0,
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
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                    height: 170.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        description,
                        style: TextStyle(
                            color: AppColors.textColor, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "R\$$price",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                        fontSize: 25.0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 40.0,
                  width: 290.0,
                  child: TextButton(
                    onPressed: () {
                      changeScreen(id);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            AppColors.buttonColor)),
                    child: Text(
                      'Ver detalhes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
