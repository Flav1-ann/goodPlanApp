import 'package:flutter/material.dart';
import 'models/Product.dart';
import 'package:test1/screens/home/home_screen.dart';
import 'package:test1/screens/profile/profile_screen.dart';
import 'package:test1/screens/sellProduct/sell_screen.dart';

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 4,
            child: Scaffold(
            appBar: AppBar(
              title: Text("MY APPBAR"),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.lightGreen, Colors.green],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                )),
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                tabs: [
                  Tab(icon: Icon(Icons.home),text: 'Accueil'),
                  Tab(icon: Icon(Icons.shopping_bag),text: 'Vendre'),
                  Tab(icon: Icon(Icons.message),text: 'Messages'),
                  Tab(icon: Icon(Icons.face),text: 'Profil'),
                ],
              ),
            ),
          body: TabBarView(
            children: [
              HomeScreen(),//Accueil
              SellScreen(),
              buildPage('Message'),
              ProfileScreen(),
            ],
          )
        )));
  }
  Widget buildPage(String namePage)=>Center(
    child: Text(
      namePage,
      style: TextStyle(fontSize: 28),
    ),
  );
}
