import 'package:flutter/material.dart';

class MatriksPage extends StatefulWidget {
  @override
  _MatriksPageState createState() => _MatriksPageState();
}

class _MatriksPageState extends State<MatriksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text("Coba"),
      ),
      body: ListView(
        children: <Widget>[
          new Card(
            elevation: 2.0,
            color: Colors.brown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: new CircleAvatar(
                          child: new Text(
                            "M",
                            style: TextStyle(color: Colors.brown),
                          ),
                          backgroundColor: const Color(0xFFFFFFFF),
                        ),
                      ),
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 8.0),
                              child: new Text(
                                "MATRIKS".toUpperCase(),
                                style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            new Container(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, left: 8.0),
                              child: new Text(
                                "Modul",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          new Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        "Pengertian MATRIK".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.grey),
                      ),
                      new Divider(),
                      new Text(
                        "Matriks merupakan susunan bilangan real (Kompleks) berbentuk empat persegi panjang yang dibatasi oleh tanda kurung ditulis dengan : ",
                        textAlign: TextAlign.center,
                      ),
                      new Image.asset(
                        'img/matrik1.jpg',
                        width: 350.0,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Istilah-istilah".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.grey),
                      ),
                      new Row(
                        children: <Widget>[
                          new Text(" * "),
                          new Text("Lambang matrik digunakan huruf A, B, C")
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new Text(" * "),
                          Flexible(
                            child: new Text(
                                "Elemen matrik digunakan lambang huruf kecil a, b, c"),
                          )
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new Text(" * "),
                          new Text("Bagian mendatar disebut baris")
                        ],
                      ),
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(" * "),
                          Flexible(
                              child: new Text("Bagian tegak disebut kolom"))
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new Text(" * "),
                          Flexible(
                            child: new Text(
                                "Indeks-I menyatakan baris, Indeks-J menyatakan kolom"),
                          )
                        ],
                      ),
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(" * "),
                          Flexible(
                              child: new Text(
                                  "Jumlah baris = m, jumlah kolom = n"))
                        ],
                      ),
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(" * "),
                          Flexible(
                              child: new Text("Ukuran matriks disebut Ordo"))
                        ],
                      ),
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(" * "),
                          Flexible(
                              child: new Text(
                                  "Matriks dengan jumlah baris = m, jumlah kolom = n disebut dengan ukuran (m x n) atau matrik berordo (m x n)"))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              "Contoh".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
