import 'package:flutter/material.dart';

class InversePage extends StatefulWidget {
  @override
  _InversePageState createState() => _InversePageState();
}

class _InversePageState extends State<InversePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
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
                            "I",
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
                                "Inverse".toUpperCase(),
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
        ],
      ),
    );
  }
}