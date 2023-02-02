import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(BottomHeader());

class BottomHeader extends StatefulWidget {
  const BottomHeader({super.key});

  @override
  State<BottomHeader> createState() => _BottomHeaderState();
}

class _BottomHeaderState extends State<BottomHeader> {
  List<dynamic> departamentList = [];
  @override
  void initState() {
    getdepartaments(); //fetching data
    super.initState();
  }

  void getdepartaments() async {
    try {
      Response response = await Dio().get("http://127.0.0.1:3000/departaments");
      setState(() {
        departamentList = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    void changeScreen(depart) {
      Navigator.pushNamed(
        context,
        '/department',
        arguments: <String, String>{
          'departmentChoosed': depart,
        },
      );
    }

    return Container(
      color: Color.fromARGB(255, 250, 212, 0),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
          children: departamentList
              .map(
                (depart) => TextButton(
                    onPressed: () {
                      changeScreen(depart);
                    },
                    child: Text(
                      depart,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              )
              .toList()),
    );
  }
}
