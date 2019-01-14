import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Setup/sign_in.dart';
import 'package:flutter_app/Pages/Setup/sign_up.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cheto"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          RaisedButton(
            onPressed: navegarAIngresar,
            child: Text('Ingresar'),
          ),
          RaisedButton(
            onPressed: navegarARegistrar,
            child: Text('Registrar'),
          )
        ],
      ),
    );
  }

  void navegarAIngresar(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginPage(),fullscreenDialog: true));
  }
  void navegarARegistrar(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> SignUpPage()));
  }
}
