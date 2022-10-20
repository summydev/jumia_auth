import 'package:flutter/material.dart';

String uri = 'http://192.168.43.216:4000';

class GlobalVariables {
  // static const appBarGradient = LinearGradient(
  //   colors: [
  //     Color.fromARGB(255, 29, 201, 192),
  //     Color.fromARGB(255, 125, 221, 216),
  //   ],
  //   stops: [0.5, 1.0],
  // );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color.fromARGB(255, 204, 205, 207);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const kHeaderText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}
