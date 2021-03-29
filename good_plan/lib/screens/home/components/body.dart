import 'package:flutter/material.dart';
import 'package:test1/constants.dart';
import 'package:test1/models/Product.dart';
import 'package:test1/screens/details/details_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'item_card.dart';
///Class qui permet de modifier la page pricipal "ACCUEIL"
class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List data;
    Future<String> getData() async {
      var response = await http.get(
          Uri.encodeFull("http://192.168.1.22:8027/goodplan/api/Product/findAll"),
          headers: {
            "Accept": "application/json"
          }
      );
      data = json.decode(response.body);
      print(data[0]["name"]);

      print(new Product(
          id: data[0]["id"],
          title: data[0]["title"],
          price: data[0]["price"],
          size: data[0]["size"],
          description: data[0]["description"],
          image: "assets/images/bag_1.png",
          color: Color(data[0]["name"])));
      return "Success!";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Accueil",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),

          ),
        ),
      ],
    );
  }
}
