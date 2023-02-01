// import 'dart:convert';

// import 'package:learn/models/Product_Model.dart';
// import 'package:learn/repository/product_repository.dart';
// import 'package:http/http.dart' as http;

// class ProductRepository implements IProductRepository {
//   @override
//   Future<List<ProductModel>> findAllProducts() async {
//     final response = await http.get(Uri.parse(
//         'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider'));

//     final List<Map<String, dynamic>> responseMap = jsonDecode(response.body);
//     return responseMap.map<ProductModel>((resp) => {
//       final model = ProductModel()
//     }).toList();
//   }
// }
