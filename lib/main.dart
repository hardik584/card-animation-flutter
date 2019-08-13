import 'package:flutter/material.dart';
import 'package:design1/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstLoginScreen(),
   
    );
  }
}