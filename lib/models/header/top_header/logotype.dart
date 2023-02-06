import 'package:flutter/material.dart';

class Logotype extends StatelessWidget {
  const Logotype({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.0, right: 100.0),
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
    );
  }
}
