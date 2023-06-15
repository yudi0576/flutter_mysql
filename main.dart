import 'package:flutter/material.dart';
import 'package:flutter_mysql/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MySQL',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
