import 'package:flutter/material.dart';
import 'package:learn/models/Movie_Model.dart';

void main() => runApp(SearchPage());

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MovieModel> moviesList = [
    MovieModel("King Kong", 1999, 10.0),
    MovieModel("Titanic", 1900, 7.0),
    MovieModel("Avatar", 2000, 6.0),
  ];

  List<MovieModel> displayList = List.from(moviesList);
  void updateList(String value) {
    setState(() {
      displayList = moviesList
          .where((element) =>
              element.movieTitle!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a movie",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.amber,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "eg:Dark Knight",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.purple.shade900),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: displayList.isEmpty
                    ? Center(
                        child: Text(
                        "Sem resultados",
                      ))
                    : ListView.builder(
                        itemCount: displayList.length,
                        itemBuilder: (context, index) => ListTile(
                              title: Text(
                                displayList[index].movieTitle!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${displayList[index].rating!}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                '${displayList[index].rating!}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )))
          ],
        ),
      ),
    );
  }
}
