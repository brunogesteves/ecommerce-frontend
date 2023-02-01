import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';
import 'package:learn/models/app_styles.dart';
import 'package:dio/dio.dart';

import '../../views/eletronics.dart';
import '../../views/furniture.dart';

void main() => runApp(BottomHeader());

class BottomHeader extends StatefulWidget {
  const BottomHeader({super.key});

  @override
  State<BottomHeader> createState() => _BottomHeaderState();
}

class _BottomHeaderState extends State<BottomHeader> {
  List<dynamic> categoriesList = [];
  @override
  void initState() {
    getHttp(); //fetching data
    super.initState();
  }

  void getHttp() async {
    try {
      Response response = await Dio().get("http://127.0.0.1:3000/categories");
      setState(() {
        categoriesList = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 250, 212, 0),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
          children: categoriesList
              .map(
                (cat) => TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => cat()),
                      );
                    },
                    child: Text(
                      cat,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              )
              .toList()),
    );
  }
}
