import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Setup/welcome.dart';


void main()=>runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hola",
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: WelcomePage(),
    );
  }
}

