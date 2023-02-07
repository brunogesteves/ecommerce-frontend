import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';
import 'package:learn/providers/user_id.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

void main() => runApp(User());

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  int userIdNumber = 1;
  Map<String, dynamic> userInformation = {};
  List<dynamic> userProducts = [];

  @override
  void initState() {
    super.initState();
    getInformation();
  }

  void getInformation() async {
    int idNumber = context.read<UserProfile>().userId;
    try {
      Response response = await Dio().get(
        "http://127.0.0.1:3000/user/getUserInformation",
        queryParameters: {"idNumber": idNumber},
      );
      setState(() {
        userInformation = response.data;
        userProducts.add(response.data["shopping"]);
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    // List<String> fields = ["Nome", "Senha", "Email"];
    userIdNumber = context.read<UserProfile>().userId;

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
                "Área do Usúario",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              )
            ],
          ),
        ),
        Container(
            child: userInformation.isEmpty
                ? Text("Carregando",
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 30.0,
                        decoration: TextDecoration.none))
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          child: TextField(
                            onChanged: (String value) async {},
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffF02E65)),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 66, 125, 145)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: userInformation["name"],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          child: TextField(
                            onChanged: (String value) async {},
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffF02E65)),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 66, 125, 145)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: userInformation["email"],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          child: TextField(
                            obscureText: true,
                            onChanged: (String value) async {},
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffF02E65)),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 66, 125, 145)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: userInformation["cpf"],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => item.card()),
                          // );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                AppColors.buttonColor)),
                        child: Text(
                          "Atualizar",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Compras já realizadas",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: userProducts
                                  .map(
                                    (prod) => Container(
                                      color: Colors.white,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 50,
                                              left: 60.0,
                                              bottom: 50.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/images/logotype.png"),
                                                width: 50.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 50.0),
                                                child: SizedBox(
                                                    width: 300.0,
                                                    child: Text(
                                                      prod["nome"].toString(),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .textColor,
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
                                                    prod["preco"].toString(),
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.textColor,
                                                        fontSize: 20.0,
                                                        decoration:
                                                            TextDecoration
                                                                .none)),
                                              ),
                                            ],
                                          )),
                                    ),
                                  )
                                  .toList())
                        ],
                      ),
                    ],
                  )),
      ]),
    );
  }
}
