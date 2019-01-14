import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Pages/Home.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>new _LoginPageState();

}
class _LoginPageState extends State<LoginPage>{
  String _email,_password;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Ingresar"),
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
              onPressed: signIn,
              child: Text('enviar'),
            )
          ],
        ),
      ),
    );
  }
  Future<void> signIn()async{
    final formState = _formKey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> Home(user:user)));
      }catch(e){
        print(e.message);

      }
    }

  }

}