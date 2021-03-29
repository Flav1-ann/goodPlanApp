import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test1/screens/sellProduct/sell_screen.dart';
import 'package:test1/main.dart';

class ForgottenPassWord extends StatefulWidget {
  createState() {
    return _ForgottenPassWord();
  }
}

class _ForgottenPassWord extends State<ForgottenPassWord>  {
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
          child: Text('Forgot password'),
        ),
      ),
    );
  }
}