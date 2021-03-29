import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Register extends StatefulWidget {
  createState() {
    return _Register();
  }
}

class _Register extends State<Register>  {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
    ),
    body: Center(
      child: Container(
        color: Colors.white,
        child: Text('Register'),
      ),
    ),
  );
}
}