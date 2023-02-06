import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> fields = ["Nome", "Senha", "CPF", "Email"];
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          color: AppColors.headerBackGround,
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: AssetImage("assets/images/logotype.png"),
                width: 50.0,
              ),
              Text(
                "Usúario",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: fields.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: TextField(
                    onChanged: (String value) async {},
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffF02E65)),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: fields[index],
                    ),
                  ),
                ),
              );
            }),
        TextButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => item.card()),
            // );
          },
          child: Text(
            "Atualizar",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "Compras já realizadas",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ]),
    );
  }
}
