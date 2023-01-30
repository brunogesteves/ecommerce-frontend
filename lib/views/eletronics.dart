import 'package:flutter/material.dart';

void main() => runApp(Eletronics());

class Eletronics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eletronícos"),
      ),
      body: ElevatedButton(
        child: Text("Eletronícos"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Eletronics()),
          );
        },
      ),
    );
  }
}
