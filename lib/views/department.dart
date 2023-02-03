import 'package:flutter/material.dart';
import 'package:learn/models/header/header.dart';
import 'package:dio/dio.dart';
import 'package:learn/models/product_card.dart';

void main() => runApp(Department());

class Department extends StatefulWidget {
  const Department({super.key});

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  List<dynamic> productsFromUniqueDepartment = [];
  String queryDepartment = "Computers";
  @override
  void initState() {
    super.initState();
  }

  void getListProducts() async {
    try {
      Response response = await Dio().get(
          "http://127.0.0.1:3000/fromuniquedepartment",
          queryParameters: {"queryDepartment": queryDepartment});
      setState(() {
        productsFromUniqueDepartment = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final departmentChoosed = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    setState(() {
      queryDepartment = departmentChoosed['departmentChoosed'] ?? "";

      getListProducts(); //fetching data
    });
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(),
          Text(departmentChoosed['departmentChoosed'] ??
              "Escolha um departamento"),
          Wrap(
              children: productsFromUniqueDepartment
                  .map((prod) => ProductCard(
                      nameProduct: prod["nome"],
                      fileImage:
                          "https://static.vecteezy.com/ti/vetor-gratis/p3/226407-tshirt-vector-camisa-preta-gratis-vetor.jpg",
                      description: prod["descricao"],
                      id: prod["id"],
                      price: prod["preco"]))
                  .toList()),
        ],
      ),
    )));
  }
}
