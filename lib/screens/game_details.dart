import 'package:flutter/cupertino.dart';
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
        body: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black12,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 45,
                                width: 45,
                                child: Image.network('https://upload.wikimedia.org/wikipedia/en/thumb/3/33/Charlotte_49ers_logo.svg/1200px-Charlotte_49ers_logo.svg.png'),
                              ),
                              Text('UNCC',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                              ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                          child: Text('50',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                          child: Text('vs',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                          child: Text('30',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 5),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Appalachian_State_Mountaineers_logo.svg/1200px-Appalachian_State_Mountaineers_logo.svg.png'),
                              ),
                              Text('APP St',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Card(
                            child: SizedBox(
                              width: 90,
                              height: 30,
                              child: Center(
                                child: Text('Standings',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Card(
                            child: SizedBox(
                              width: 90,
                              height: 30,
                              child: Center(
                                child: Text('Schedule',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Card(
                            child: SizedBox(
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Text('Play-By-Play',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.black12,
                          child: Card(
                            child: SizedBox(
                              width: 90,
                              height: 30,
                              child: Center(
                                child: Text('Chat',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: GameUpdates(),
              ),
            ],
          ),
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

class GameUpdates extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, int index){
              return Card(
                child: ListTile(
                  title: Text('Update Heading'),
                  subtitle: Text('Update Details'),
                ),
              );
            }
        ),
      ),
    );

  }
}

