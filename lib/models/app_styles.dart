import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle ralewayStyle = GoogleFonts.raleway();

class Universe {
  static var number = 1;
  static int test() {
    // function definition
    return number;
  }

  static changeInteger(int a) {
    number = a;
    // test(); // this can be replaced with any static method
  }
}
