import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                          child: Text('10',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
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
                          child: Text('52',
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
                                child: Image.network('https://www.clemson.edu/brand/resources/logos/paw/orange.png'),
                              ),
                              Text('Clemson',
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
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/Standing'),
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
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/Schedule'),
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
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/Chat'),
                            child: Card(
                              child: SizedBox(
                                width: 50,
                                height: 30,
                                child: Center(
                                  child: Text('Chat',
                                    style: TextStyle(fontSize: 16),
                                  ),
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

class Play {
  final String title;
  final String action;

  Play(
      this.title,
      this.action,
      );
}

class GameUpdates extends StatelessWidget{
  List<Play> myList = [];
  final test1 = new Play('1st and 10 at CLT 25', '(6:12 - 4th) Aidan Swanson kickoff for 65 yds for a touchback');
  final test2 = new Play('2nd & 10 at CLT 25', '(5:00 - 4th) Ishod Finger run for no gain to the Charl 25');
  final test3 = new Play('3rd & 10 at CLT 25', '(4:30 - 4th) CHARLOTTE Penalty, False Start (-5 Yards) to the Charl 20');
  final test4 = new Play('3rd & 15 at CLT 20', '(4:00 - 4th) Brett Kean run for 5 yds to the Charl 25');
  final test5 = new Play('4th & 10 at CLT 25', '(3:31 - 4th) Connor Bowler punt for 48 yds , Will Brown returns for 13 yds to the Clem 40');
  final test6 = new Play('1st & 10 at CLEM 40','(3:00 - 4th) Taisun Phommachanh pass complete to Will Brown for 8 yds to the Clem 48');
  final test7 = new Play('2nd & 2 at CLEM 48','(2:40 - 4th) Chez Mellusi run for 3 yds to the Charl 49 for a 1ST down');
  final test8 = new Play('1st & 10 at CLT 49','(2:25 - 4th) Chez Mellusi run for 8 yds to the Charl 41');
  final test9 = new Play('2nd & 2 at CLT 41','(1:37 - 4th) Ben Batson run for 5 yds to the Charl 36 for a 1ST down');
  final test10 = new Play('1st & 10 at CLT 36', '(1:30 - 4th) CLEMSON Penalty, False Start (-5 Yards) to the Charl 41');
  final test11 = new Play('1st & 15 at CLT 41','(0:55 - 4th) Chez Mellusi run for 4 yds to the Charl 37');
  final test12 = new Play('2nd & 11 at CLT 37','(0:25 - 4th) Patrick McClure run for 3 yds to the Charl 34');
  final test13 = new Play('3rd & 8 at CLT 34','(0:05 - 4th) Chez Mellusi run for 7 yds to the Charl 27');
  final test14 = new Play('4th & 1 at CLT 27','(0:00 - 4th) Patrick McClure run for 9 yds to the Charl 18 for a 1ST down');


  @override
  Widget build(BuildContext context) {
    var myStream = Stream<int>.periodic(Duration(seconds:5), (x) => x).take(15);
    myList.add(test1);
    myList.add(test2);
    myList.add(test3);
    myList.add(test4);
    myList.add(test5);
    myList.add(test6);
    myList.add(test7);
    myList.add(test8);
    myList.add(test9);
    myList.add(test10);
    myList.add(test11);
    myList.add(test12);
    myList.add(test13);
    myList.add(test14);

    /* return StreamBuilder(
      stream: myStream,
      initialData: '0',
      builder: (ctx, snapshot){
        return Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Text('${snapshot.data}'),
          ),
        );
      },
    ); */

    return Expanded(
      child: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: myList.length,
            itemBuilder: (context, int index){
                return Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: ListTile(
                      title: Text('${myList[index].title}'),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text('${myList[index].action}'),
                      ),
                    ),
                  ),
                );

            }
        ),
      ),
    );

  }
}

