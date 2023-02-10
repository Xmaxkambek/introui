import 'package:flutter/material.dart';
import 'package:pdpui3/Pages.dart/HomePage.dart';
import 'package:pdpui3/Pages.dart/IntroPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const IntroPage(),
    routes: {
      HomePage.id: (context) => const HomePage(),
      IntroPage.id: (context) => const IntroPage()
    },
  ));
}
