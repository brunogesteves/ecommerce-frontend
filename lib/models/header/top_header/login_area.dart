import 'package:flutter/material.dart';

class LoginArea extends StatelessWidget {
  const LoginArea({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
      child: Padding(
        padding: EdgeInsets.only(left: 30.0),
        child: TextButton(
            onPressed: () => _dialogBuilder(context),
            child: Text("Nome do usuario")),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Entre com email e senha'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
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
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 66, 125, 145)),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Procurar",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (String value) async {},
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => item.card()),
              // );
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
      );
    },
  );
}
