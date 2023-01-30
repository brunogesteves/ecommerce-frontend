import 'package:flutter/material.dart';

void main() => runApp(Furniture());

class Furniture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moveis"),
      ),
      body: ElevatedButton(
        child: Text("Moveis"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Furniture()),
          );
        },
      ),
    );
  }
}
