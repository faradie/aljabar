import 'package:flutter/material.dart';
import 'package:matriks/scaffold/home.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Matriks",
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColorDark: Colors.brown[900],
      ),
      home: HomePage(),
    );
  }
}