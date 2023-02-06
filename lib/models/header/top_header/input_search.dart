import 'package:flutter/material.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({super.key});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  String searchTerm = "";

  @override
  Widget build(BuildContext context) {
    void getResults(searchTerm) {
      print(searchTerm);
      Navigator.pushNamed(
        context,
        '/search',
        arguments: <String, String>{
          'searchChoosed': searchTerm,
        },
      );
    }

    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (String value) async {
              setState(() {
                searchTerm = value;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.white,
              hintText: "Procurar",
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  getResults(searchTerm);
                },
              ),
            ),
          ),
        ));
  }
}
