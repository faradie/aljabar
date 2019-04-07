import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatrikKuis extends StatefulWidget {
  @override
  _MatrikKuisState createState() => _MatrikKuisState();
}

class _MatrikKuisState extends State<MatrikKuis> {
  final _b1k1 = new TextEditingController();
  final _b1k2 = new TextEditingController();
  final _b2k1 = new TextEditingController();
  final _b2k2 = new TextEditingController();
  var rng = new Random();
  var rng2 = new Random();
  var matrik1, matrik2, hasil;
  int x2 = 0, y2 = 0;
  bool tekan = true;
  _showResult(String judul, String isinya, Color warnanya) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                  width: 300.0,
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // // crossAxisAlignment: CrossAxisAlignment.stretch,
                        // mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            judul,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: warnanya),
                          ),
                          SizedBox(height: 16.0),
                          new Text(
                            isinya,
                          ),
                          SizedBox(height: 16.0),
                        ],
                      ),
                      ButtonTheme(
                        minWidth: 200.0,
                        height: 60.0,
                        child: new RaisedButton(
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          onPressed: null,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                                bottomRight: Radius.circular(32.0)),
                          ),
                          padding: const EdgeInsets.only(),
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )),
            ));
  }

  void submit() {
    if (_b1k1.text.length == 0 ||
        _b1k2.text.length == 0 ||
        _b2k1.text.length == 0 ||
        _b2k2.text.length == 0) {
      _showResult("Perhatian", "Isikan dulu hasil baris dan kolom", Colors.red);
    } else {
      setState(() {
        tekan = false;
      });
      Function deepEq = const DeepCollectionEquality().equals;
      List<List<int>> jawaban = [
        [int.parse(_b1k1.text), int.parse(_b1k2.text)],
        [int.parse(_b2k1.text), int.parse(_b2k2.text)]
      ];
      print("ini lho ${deepEq(hasil,jawaban)}");
      if (deepEq(hasil, jawaban) == true) {
        _showResult("Selamat", "Jawaban anda benar!!", Colors.blue);
        setState(() {
        tekan = true;

      });
      } else {
        _showResult("Maaf", "Jawaban anda salah!!", Colors.red);
        setState(() {
        tekan = true;
      });
      }
      
    }
  }

  Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              _start = _start + 1;
            }));
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = matrik1[0].length;
    int x, y = 0;
    x = (gridStateLength - index) > 0 ? 0 : 1;
    y = (index % gridStateLength);
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
    if (index == 0) {
      x2 = 0;
    } else if (index == 1) {
      x2 = 0;
    } else if (index == 2) {
      x2 = 1;
    } else if (index == 3) {
      x2 = 1;
    } else if (index == 4) {
      x2 = 2;
    } else if (index == 5) {
      x2 = 2;
    } else {
      x2 = 0;
    }
    y2 = (index % 2);

    return GestureDetector(
      onTap: () {},
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Center(
            child: _buildGridItem2(x2, y2),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem2(int x, int y) {
    return Text("${matrik2[x][y]}");
  }

  Widget _buildGameBody2() {
    int gridStateLength = matrik2.length;
    return Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 1.2,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0)),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2.0,
              crossAxisCount: gridStateLength - 1,
            ),
            itemBuilder: _buildGridItems2,
            itemCount: (gridStateLength - 1) * gridStateLength,
          ),
        ),
      ),
    ]);
  }

  void hitungMatrik() {
    for (var i = 0; i < 2; i++) {
      for (var j = 0; j < 2; j++) {
        hasil[i][j] = matrik1[i][0] * matrik2[0][j] +
            matrik1[i][1] * matrik2[1][j] +
            matrik1[i][2] * matrik2[2][j];
        print("hasil 1 : ${matrik1[i][0] * matrik2[0][j]}");
        print("hasil 2 : ${matrik1[i][1] * matrik2[1][j]}");
        print("hasil 3 : ${matrik1[i][2] * matrik2[2][j]}");
      }
    }

    print("hasil matrik : $hasil");
  }

  @override
  void initState() {
    hasil = new List<List<int>>.generate(2,
        (int index) => List<int>.generate(2, (int index2) => rng.nextInt(9)));
    matrik1 = new List<List<int>>.generate(2,
        (int index) => List<int>.generate(3, (int index2) => rng.nextInt(9)));
    matrik1.shuffle();
    matrik2 = new List<List<int>>.generate(3,
        (int index3) => List<int>.generate(2, (int index3) => rng2.nextInt(9)));
    matrik2.shuffle();
    startTimer();
    hitungMatrik();
    super.initState();
  }

    @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.timer),
        label: Text("$_start Detik"),
        onPressed: null,
      ),
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
              margin: const EdgeInsets.all(10.0),
              child: Text("WAKTU : $_start detik",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))),
          SizedBox(height: 16.0),
          Container(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                "Matrik 1",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              )),
          _buildGameBody(),
          SizedBox(height: 16.0),
          Container(
              padding: const EdgeInsets.all(10.0),
              child: new Text("Matrik 2",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0))),
          _buildGameBody2(),
          SizedBox(height: 16.0),
          Container(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                  "Hasil yang di dapat dari perkalian Matrik 1 dan 2 di atas adalah?",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0))),
          SizedBox(height: 16.0),
          Container(
              padding: const EdgeInsets.all(10.0),
              child: new Text("Masukkan jawaban dikolom bawah ini :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Colors.grey))),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                            keyboardType: TextInputType.number,
                            controller: _b1k1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                labelText: 'B 1 K 1',
                                contentPadding: EdgeInsets.all(10))),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      new Flexible(
                        child: new TextField(
                            controller: _b1k2,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                labelText: 'B 1 K 2',
                                contentPadding: EdgeInsets.all(10))),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                            controller: _b2k1,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                labelText: 'B 2 K 1',
                                contentPadding: EdgeInsets.all(10))),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      new Flexible(
                        child: new TextField(
                            controller: _b2k2,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                labelText: 'B 2 K 2',
                                alignLabelWithHint: true,
                                contentPadding: EdgeInsets.all(10))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: CupertinoButton(
              color: Colors.brown,
              child: const Text('Jawab'),
              onPressed: tekan == true ? submit : null,
            ),
          ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}
