import 'package:flutter/material.dart';
import 'package:learn/models/header/bottom_header.dart';
import 'package:learn/models/header/top_header.dart';

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
