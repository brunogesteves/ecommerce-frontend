import 'package:flutter/material.dart';
import 'package:learn/models/app_colors.dart';
import 'package:learn/providers/user_id.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class LoginArea extends StatefulWidget {
  const LoginArea({super.key});

  @override
  State<LoginArea> createState() => _LoginAreaState();
}

class _LoginAreaState extends State<LoginArea> {
  @override
  Widget build(BuildContext context) {
    String username = context.watch<UserProfile>().userInfo["name"].toString();
    return !context.read<UserProfile>().isUserConnected
        ? InkWell(
            onDoubleTap: () {},
            child: Padding(
                padding: EdgeInsets.only(left: 30.0), child: LoginDialog()),
          )
        : Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TextButton(
                onPressed: () => {
                      Navigator.pushNamed(
                        context,
                        '/user',
                      )
                    },
                child: Text(
                  username.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                )),
          );
  }
}

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  String email = "pessoa@email.com";
  String password = "mudar123";

  void getLoginInfo() async {
    try {
      Response response = await Dio().get(
          "http://127.0.0.1:3000/user/userlogin",
          queryParameters: {"email": email, "password": password});

      context.read<UserProfile>().changeUserData(response.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Entrada'),
          content: const Text('Entrar com email e senha'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (String value) {
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
                  hintText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
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
                  hintText: "Senha",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextButton(
              onPressed: () {
                getLoginInfo();
                Navigator.pop(context);
              },
              child: Text(
                "Entrar",
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
      child: Text(
        "Fazer Login",
        style: TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
