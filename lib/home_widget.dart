import 'package:flutter/material.dart';
import 'placeholder_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          height: 175,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 325,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.orange,
              ),
              Container(
                width: 325,
                color: Colors.orange,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.orange,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.orange,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.orange,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),
        ),
        Container(
          height: 175,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 325,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.green,
              ),
              Container(
                width: 325,
                color: Colors.green,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.green,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.green,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.green,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),
        ),
        Container(
          height: 175,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 325,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.purple,
              ),
              Container(
                width: 325,
                color: Colors.purple,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.purple,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.purple,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.purple,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),
        ),
        Container(
          height: 175,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 325,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.blue,
              ),
              Container(
                width: 325,
                color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),
        ),
        Container(
          height: 175,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 325,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.red,
              ),
              Container(
                width: 325,
                color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                width: 325,
                color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),
        ),

      ],
    ),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.red),
    PlaceholderWidget(Colors.black38),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UNCC Athletics App'),
      ),
      body: Container(
              child: _children[_currentIndex]
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today),
              title: new Text("Schedule")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.table_chart),
              title: new Text("Scores")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.assessment),
              title: new Text("Standings")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.more_horiz),
              title: new Text("More")
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}