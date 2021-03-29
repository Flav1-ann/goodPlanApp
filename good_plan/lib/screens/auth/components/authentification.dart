import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test1/screens/sellProduct/sell_screen.dart';
import 'package:test1/screens/auth/components/forgottenPassWord.dart';
import 'package:test1/screens/auth/components/register.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen>  {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool checked = false;
  String responseConnected  = "";
  get validateEmail => null;

  void login(String login,String password) async {
    List data;
    var response = await http.post(
        Uri.encodeFull("http://192.168.1.22:8027/goodplan/api/Auth/login"),
        headers:<String,String> {
          "Content-Type": "application/json"
        },
      body:jsonEncode(<String,String>{
          "login" : login,
          "password" : password
      })
    );
    String responseString = response.body;
    if(response.statusCode == 200)
    {
      responseConnected =  "Success";
    }else {
      responseConnected = "error";
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 180.0, left: 30.0, right: 30.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                emailField(),
                passwordField(),
                Forggten_register(),
                button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: null,
      onSaved: (value) {
        setState(() {
          email = value;
        });
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'someone@company.com',
          labelText: 'Email'),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      validator: null,
      onSaved: (value) {
        setState(() {
          password = value;
        });
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.visibility_off),
          hintText: 'Enter password',
          labelText: 'Password'),
    );
  }

  Widget Forggten_register() {
    return Row(
      children: <Widget>[
    TextButton (
    child: Text("Mot de passe oublier ?"),
    onPressed: () {
      Navigator.pushNamed(context, '/forgottenPassWord');

    },
    ),TextButton (
    child: Text("Créer un compte"),
    onPressed: () {
      Navigator.pushNamed(context, '/register');

    })
      ],
    );
  }

  Widget button() {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(top: 100.0, left: 90.0),
      child: Row(
        children: <Widget>[
          FlatButton(
            child: Text(
              "Connexion".toUpperCase(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            onPressed: (){
              _formKey.currentState.save();
              login(email, password);
              print(responseConnected);
              if(responseConnected == "Success")
                Navigator.pushNamed(context, '/body');
            },
          ),
        ],
      ),
    );

  }
}
