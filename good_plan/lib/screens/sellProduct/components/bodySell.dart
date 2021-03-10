import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///Class qui permet de modifier la page pricipal "ACCUEIL"
class BodySell extends StatefulWidget {
  @override
  _BodySellState createState() => _BodySellState();
}

class _BodySellState extends State<BodySell> {
  File _image;
  List<File> _listImage = new List<File>();
  String _selectedItem = "Choisir l'état de votre objet";

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _listImage.add(image);
        _image = image;
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: OutlineButton.icon(
                          onPressed: getImage,
                          icon: Icon(Icons.add),
                          label: Text('Ajouter des photos'),
                        ),
                      ),
                      Container(
                        child: _image == null
                            ? Text("Il n'y a pas d'image")
                            : Image.file(_image),
                        height: 230,
                        width: 260,
                      ),
                      Container(
                          child: Column(
                        children: <Widget>[
                          Text(
                            "Titre",
                          ),
                          TextFormField()
                        ],
                      )),
                      Container(
                          child: Column(
                        children: <Widget>[
                          Text(
                            "Description",
                          ),
                          TextFormField()
                        ],
                      )),
                      Container(
                          child: Column(
                        children: <Widget>[
                          Text(
                            "Etat du produit",
                          ),
                          DropdownButton<String>(
                            items: <String>[
                              'Neuf',
                              'Très bonne état',
                              'Bon état',
                              'Satisfaisant'
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            },
                            hint : Text(_selectedItem),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )),
                      Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Prix",
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: '0.00'
                                ),
                              )
                            ],
                          )),
                      Container(
                          child: Column(children: <Widget>[
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: Colors.green,
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 115.0),
                          onPressed: () => {},
                          child: Text(
                            "Vendre".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ])),
                    ],
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
