import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/screens/home_page.dart';
import 'package:bmi/screens/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: cPrimaryColor, scaffoldBackgroundColor: cPrimaryColor),
      home: Homepage(),
    );
  }
}
