import 'package:flutter/material.dart';
import 'package:learn/providers/search_provider.dart';
import 'package:provider/provider.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({super.key});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (String value) async {
              context.read<SearchProvider>().searchFor(value);
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
                  Navigator.pushNamed(
                    context,
                    '/search',
                  );
                },
              ),
            ),
          ),
        ));
  }
}
