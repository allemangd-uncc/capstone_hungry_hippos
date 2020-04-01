import 'package:flutter/material.dart';


class Details extends StatelessWidget {

  static final List<Item> colorList = <Item>[
    const Item('FootBall', Colors.green),
    const Item("BasketBall", Colors.red),
    const Item("Soccer", Colors.pinkAccent),
    const Item('Baseball', Colors.orange),
  ];

  Item _curSport = colorList[0];



  @override
  Widget build(BuildContext context) {
    Item selectedSport;

    return StatefulBuilder(
      builder: (context, StateSetter setState) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Game Details'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 50.0),
                      child: Column(
                        children: <Widget>[
                          FlutterLogo(),
                          Text('Team'),
                        ],
                      ),
                    ),
                    Text('10'),
                    Text('Final'),
                    Text('30'),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Column(
                        children: <Widget>[
                          FlutterLogo(),
                          Text('Team'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Testing'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Testing'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Testing'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Testing'),
                  ),
                ],
              ),
            ),

          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              ListTile(
                title: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () => Navigator.pushNamed(context, '/'),
                ),
              ),
              ListTile(
                title: IconButton(
                  icon: Icon(Icons.table_chart),
                  onPressed: () => Navigator.pushNamed(context, '/Standing'),
                ),
              ),
              ListTile(
                title: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => Navigator.pushNamed(context, '/Schedule'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




}

class Item {
  const Item(this.name, this.color);

  final String name;
  final Color color;
}



