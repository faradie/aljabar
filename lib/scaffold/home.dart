import 'package:flutter/material.dart';
import 'package:matriks/additional/custom_popup_menu.dart';
import 'package:matriks/scaffold/section1/determinan.dart';
import 'package:matriks/scaffold/section1/inverse.dart';
import 'package:matriks/scaffold/section1/matriks.dart';
import 'package:matriks/scaffold/tabs/kuis/list_kuis.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    new MyTabs(
        title: "Aljabar Linier", color: Colors.teal[200], icon: Icons.home),
    new MyTabs(title: "Kuis", color: Colors.orange[200], icon: Icons.book),
    new MyTabs(
        title: "Riwayat", color: Colors.orange[200], icon: Icons.history),
    new MyTabs(
        title: "Profil", color: Colors.orange[200], icon: Icons.person_outline),
  ];
  MyTabs _myHandler;
  TabController _controller;
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
    _myHandler = _tabs[0];
    _controller.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacecrafts = ["MATRIK", "DETERMINAN", "INVERSE"];
    var link = [Colors.white, Colors.white, Colors.white];
    var spacecrafts2 = [
      "Persamaan Linier",
      "Vector Eigen",
      "Ruang Vector",
      "Basis",
      "Transformasi Linear"
    ];
    var link2 = [
      Colors.orange,
      Colors.purple,
      Colors.lime,
      Colors.teal,
      Colors.pink,
    ];
    var myGridView = new Container(
      margin: const EdgeInsets.all(20.0),
      child: new GridView.builder(
        itemCount: link.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              color: link[index],
              elevation: 5.0,
              child: new Container(
                child: Center(
                  child: Text(
                    spacecrafts[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontSize: 10.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MatriksPage()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeterminanPage()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InversePage()),
                );
              }
            },
          );
        },
      ),
    );

    var myGridView2 = new GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: link2.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            color: link2[index],
            elevation: 5.0,
            child: new Container(
              margin: const EdgeInsets.all(10.0),
              child: new Center(
                child: Text(
                  spacecrafts2[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          onTap: () {
            print("$index");
          },
        );
      },
    );

    return new Scaffold(
        appBar: AppBar(
          title: Text(_myHandler.title.toUpperCase()),
          centerTitle: true,
        ),
        bottomNavigationBar: new TabBar(
          controller: _controller,
          tabs: <Tab>[
            new Tab(
              icon: Icon(_tabs[0].icon),
            ),
            new Tab(
              icon: Icon(_tabs[1].icon),
            ),
            new Tab(
              icon: Icon(_tabs[2].icon),
            ),
            new Tab(
              icon: Icon(_tabs[3].icon),
            ),
          ],
          labelColor: Colors.brown,
          unselectedLabelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.brown,
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            new Container(
              child: ListView(
                children: <Widget>[
                  new Container(
                    color: Colors.blue,
                    child: myGridView,
                  ),
                  new Container(
                    child: myGridView2,
                  ),
                ],
              ),
            ),
            new ListKuis(),
            new Container(
              color: Colors.lightGreen,
            ),
            new Container(
              color: Colors.red,
            ),
          ],
        ));
  }
}

class MyTabs {
  final IconData icon;
  final String title;
  final Color color;
  MyTabs({this.title, this.color, this.icon});
}
