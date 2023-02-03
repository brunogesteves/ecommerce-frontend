import 'package:flutter/material.dart';
import 'package:learn/providers/shopping_cart.dart';
import 'package:learn/models/app_colors.dart';
import 'package:provider/provider.dart';

void main() => runApp(TopHeader());

class TopHeader extends StatefulWidget {
  const TopHeader({super.key});

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  String searchTerm = "Computers";

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

    return Container(
        color: AppColors.headerBackGround,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
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
            ),
            SizedBox(
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
                      filled: true, //<-- SEE HERE
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
                )),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: SizedBox(
                  width: 70,
                  height: 40,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset("../assets/images/car_market.png",
                          width: 10.0, color: Colors.black),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          // width: 300.0,
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            context.watch<ShoppingCart>().number.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text("Nome do usuario"),
            )
          ],
        ));
  }
}
