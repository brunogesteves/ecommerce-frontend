import 'package:flutter/material.dart';
import 'package:learn/models/app_styles.dart';

void main() => runApp(TopHeader());

class TopHeader extends StatefulWidget {
  const TopHeader({super.key});

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("sim: $count");
    setState(() {
      count = Universe.test();
    });
    return Container(
        color: Color.fromARGB(255, 250, 212, 0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 100.0),
              child: Image(
                image: AssetImage("assets/images/logotype.png"),
                width: 50.0,
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Procurar",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,

                      hintText: "Procurar",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 70),
              child: Image.asset(
                "../assets/images/car_market.png",
                width: 30.0,
              ),
            ),
            Text(count.toString())
          ],
        ));
  }
}
