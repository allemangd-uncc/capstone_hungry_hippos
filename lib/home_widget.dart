import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'drop_down_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  int _currentIndex = 0;
  var curSport = '';

  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.red),
    PlaceholderWidget(Colors.black38),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        //title: Text(appBarTitle),
        actions: <Widget>[
          DropDownWidget(),
        ],
        backgroundColor: Colors.green,
      ),
      body: _children[_currentIndex],
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