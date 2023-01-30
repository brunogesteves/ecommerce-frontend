import 'package:flutter/material.dart';

class Product {
  final String nameProduct;
  final String fileImage;
  final String infoProduct;
  final String price;

  const Product({
    required this.fileImage,
    required this.infoProduct,
    required this.nameProduct,
    required this.price,
  });

  static Product fromJson(json) => Product(
        fileImage: json["fileImage"],
        infoProduct: json["infoProduct"],
        nameProduct: json["nameProduct"],
        price: json["price"],
      );
}
