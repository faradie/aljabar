import 'package:flutter/material.dart';
import 'package:matriks/additional/custom_popup_menu.dart';
import 'package:matriks/scaffold/section1/determinan.dart';
import 'package:matriks/scaffold/section1/inverse.dart';
import 'package:matriks/scaffold/section1/matriks.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'Poin', icon: Icons.book),
  CustomPopupMenu(title: 'Score', icon: Icons.library_books),
];

class _HomePageState extends State<HomePage> {
  CustomPopupMenu _selectedChoices = choices[0];

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  popup() {
    PopupMenuButton<CustomPopupMenu>(
      elevation: 3.2,
      initialValue: choices[1],
      onCanceled: () {
        print('You have not chossed anything');
      },
      tooltip: 'This is tooltip',
      onSelected: _select,
      itemBuilder: (BuildContext context) {
        return choices.map((CustomPopupMenu choice) {
          return PopupMenuItem<CustomPopupMenu>(
            value: choice,
            child: Text(choice.title),
          );
        }).toList();
      },
    );
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
                        fontWeight: FontWeight.bold, color: Colors.brown,fontSize: 10.0),
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
        title: const Text('Aljabar Linear'),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<CustomPopupMenu>(
            elevation: 3.2,
            initialValue: choices[1],
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        fixedColor: Colors.deepPurple,
      ),
      body: new Container(
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
    );
  }
}

class SelectedOption extends StatelessWidget {
  final CustomPopupMenu choice;

  SelectedOption({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 140.0, color: Colors.white),
            Text(
              choice.title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
