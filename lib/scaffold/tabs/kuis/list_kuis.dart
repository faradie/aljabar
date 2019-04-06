import 'package:flutter/material.dart';
import 'package:matriks/scaffold/tabs/kuis/matrik/kuis_matrik.dart';

class ListKuis extends StatefulWidget {
  @override
  _ListKuisState createState() => _ListKuisState();
}

class _ListKuisState extends State<ListKuis> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MatrikKuis()),
              );
            },
            child: Card(
              elevation: 5.0,
              child: ListTile(
                title: new Text("Perkalian Matrik"),
                subtitle: new Text("Matrik"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
