import 'dart:math';

import 'package:flutter/material.dart';

class MatrikKuis extends StatefulWidget {
  @override
  _MatrikKuisState createState() => _MatrikKuisState();
}

class _MatrikKuisState extends State<MatrikKuis> {
  var rng = new Random();
  var rng2 = new Random();
  var matrik1;

  List<List<int>> matrik2 = [
    [2,3],
    [6,7],
    [1,4],
  ];

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = matrik1[0].length;
    int x, y = 0;
    x = (gridStateLength - index) > 0 ? 0 : 1;
    y = (index % gridStateLength);

    print("x : $x");
    print("y : $y");

    return GestureDetector(
      onTap: () {},
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int x, int y) {
    return Text("${matrik1[x][y]}");
  }

  Widget _buildGameBody() {
    int gridStateLength = matrik1[0].length;
    return Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 1.4,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0)),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridStateLength,
            ),
            itemBuilder: _buildGridItems,
            itemCount: gridStateLength * (gridStateLength - 1),
          ),
        ),
      ),
    ]);
  }

  Widget _buildGridItems2(BuildContext context, int index) {
    int gridStateLength2 = matrik2[0].length;
    int x, y = 0;
    x = (gridStateLength2 - index) > 0 ? 0 : 1;
    y = (index % gridStateLength2);

    print("gridStateLength2gg : $gridStateLength2");
    print("y : $y");

    return GestureDetector(
      onTap: () {},
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Center(
            child: _buildGridItem2(x, y),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem2(int x, int y) {
    return Text("${matrik2[x][y]}");
  }

  Widget _buildGameBody2() {
    int gridStateLength = matrik2[0].length;
    return Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0)),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridStateLength,
            ),
            itemBuilder: _buildGridItems2,
            itemCount: gridStateLength * (gridStateLength - 1),
          ),
        ),
      ),
    ]);
  }

  @override
  void initState() {
    matrik1 = new List<List<int>>.generate(2,
        (int index) => List<int>.generate(3, (int index2) => rng.nextInt(9)));
    matrik1.shuffle();
    // matrik2 = new List<List<int>>.generate(3,
    //     (int index) => List<int>.generate(2, (int index2) => rng2.nextInt(9)));
    // matrik2.shuffle();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 8.0),
                              child: new Text(
                                "Perkalian Matrik".toUpperCase(),
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
                                "KUIS",
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
          Container(
            padding: const EdgeInsets.all(10.0),
            child: new Text("Matrik 1")),
          _buildGameBody(),
          SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: new Text("Matrik 2")),
          _buildGameBody2()
        ],
      ),
    );
  }
}
