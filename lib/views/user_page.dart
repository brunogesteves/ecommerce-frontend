import 'package:flutter/material.dart';
import 'package:ecommerce/models/app_colors.dart';
import 'package:ecommerce/providers/user_id.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

void main() => runApp(User());

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  Map<String, dynamic> userInformation = {};
  List<dynamic> userProducts = [];
  String name = "";
  String email = "";
  String cpf = "";
  int id = 1;
  bool isUpdated = false;
  var n = 0;

  @override
  void initState() {
    super.initState();
  }

  void getShopping() async {
    setState(() {
      userInformation = context.read<UserProfile>().userInfo;
      name = userInformation["name"];
      email = userInformation["email"];
      cpf = userInformation["cpf"];
      id = userInformation["id"];
    });

    try {
      Response response = await Dio()
          .get("http://127.0.0.1:3000/user/getshopping", queryParameters: {
        "id": id,
      });
      setState(() {
        userProducts = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  void backpage() {
    if (context.read<UserProfile>().isUserConnected) {
      Navigator.pushNamed(
        context,
        '/',
      );
    }
  }

  void updateInformation() async {
    try {
      Response response = await Dio()
          .post("http://127.0.0.1:3000/user/updateuser", queryParameters: {
        "name": name,
        "email": email,
        "cpf": cpf,
        "id": id
      });
      setState(() {
        isUpdated = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    while (n == 0) {
      getShopping();
      n++;
    }

    return SingleChildScrollView(
      child: Column(children: [
        Container(
          color: AppColors.headerBackGround,
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/',
                    );
                  },
                  child: Image(
                    image: AssetImage("assets/images/logotype.png"),
                    width: 50.0,
                  ),
                ),
              ),
              Text(
                "Área do Usúario",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<UserProfile>().closeSession(false);
                  Navigator.pushNamed(
                    context,
                    '/search',
                  );
                },
                child: Text(
                  "Sair",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: TextField(
                  onChanged: (String value) async {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF02E65)),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 66, 125, 145)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: name,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: TextField(
                  onChanged: (String value) async {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF02E65)),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 66, 125, 145)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: email,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: TextField(
                  obscureText: true,
                  onChanged: (String value) async {
                    setState(() {
                      cpf = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF02E65)),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 66, 125, 145)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: cpf,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                updateInformation();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColors.buttonColor)),
              child: Text(
                "Atualizar Dados",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
            SizedBox(height: 20.0),
            Text(isUpdated ? "Atualizado" : "", style: TextStyle(fontSize: 25)),
            SizedBox(height: 20.0),
            Text(
              "Compras realizadas",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
            userProducts.isEmpty
                ? CircularProgressIndicator(
                    semanticsLabel: 'Carregando',
                  )
                : ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: userProducts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 50, left: 60.0, bottom: 50.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                                userProducts[index]["imagem"],
                                                fit: BoxFit.cover,
                                                width: 50.0),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50.0),
                                              child: SizedBox(
                                                  width: 300.0,
                                                  child: Text(
                                                    userProducts[index]["nome"]
                                                        .toString()
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: 20.0,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 50.0),
                                              child: Text(
                                                  userProducts[index]["preco"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: 20.0,
                                                      decoration:
                                                          TextDecoration.none)),
                                            )
                                          ]));
                                }),
                          ])
                    ],
                  ),
          ],
        )),
      ]),
    );
  }
}
