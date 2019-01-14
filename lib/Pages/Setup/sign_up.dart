import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Setup/sign_in.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email,_password;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'please escribe algo';
                }
              },
              onSaved:(input)=>_email = input ,
              decoration: InputDecoration(
                  labelText: 'email'
              ),
            ),
            TextFormField(
              validator: (input){
                if(input.length<6){
                  return 'please escribe comtraseña mas de 6';
                }
              },
              onSaved:(input)=>_password = input ,
              decoration: InputDecoration(
                  labelText: 'contraseña'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signUp,
              child: Text('enviar'),
            )
          ],
        ),
      ),
    );
  }
  void signUp() async{
    final formState = _formKey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}
