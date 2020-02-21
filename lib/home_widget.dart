import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:capstone_hungry_hippos/theme_state.dart';
import 'placeholder_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex = 0;
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
        title: Text('UNCC Athletics App'),
        actions: <Widget> [
          Switch(
            value: Provider.of<ThemeState>(context).theme == ThemeType.DARK,
            onChanged: (value) {
              Provider.of<ThemeState>(context).theme =
              value ? ThemeType.DARK : ThemeType.LIGHT;
              setState(() {});
            },
          ),
        ]),
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("UNCC Athletics"),

            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}