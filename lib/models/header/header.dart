import 'package:flutter/material.dart';
import 'package:learn/models/header/bottomHeader.dart';
import 'package:learn/models/header/topHeader.dart';

void main() => runApp(Header());

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[TopHeader(), BottomHeader()],
    );
  }
}
// double width = MediaQuery.of(context).size.width;
