import 'package:flutter/material.dart';
import 'package:gamezone/src/authify/pages/login_page.dart';
import 'package:gamezone/src/discover/pages/main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Zone',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: MainPage(),
    );
  }
}
