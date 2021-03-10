import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test1/models/Product.dart';

import '../../../constants.dart';
///Class qui modifie les boutons lorsque l'on est dans un item
class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            child: Column(
              children: <Widget>[
                OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                  ),
                  splashColor: product.color,
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 60.0),
                  color: product.color,
                  onPressed: () {},
                  child: Text(
                    "Envoyer un message".toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: product.color,
                    ),
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  color: product.color,
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 115.0),
                  onPressed: () {},
                  child: Text(
                    "Acheter".toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
