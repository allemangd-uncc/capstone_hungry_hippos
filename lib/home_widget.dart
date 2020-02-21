import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:capstone_hungry_hippos/theme_state.dart';
import 'placeholder_widget.dart';

class Home extends StatelessWidget {
  final List<Object> _curSport = ['FootBall', Colors.green];

  final List<Item> colorList = <Item>[
    const Item("FootBall", Colors.red),
    const Item("Soccer", Colors.pinkAccent),
    const Item('Baseball', Colors.yellow),
  ];

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
    int _currentBodyIndex = 0;
    Item selectedSport;

    return StatefulBuilder(
      builder: (context, StateSetter setState) =>
          Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: DropdownButton<Item>(
                  value: selectedSport,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  style: TextStyle(color: Colors.black),
                  iconEnabledColor: Colors.white,
                  onChanged: (Item value) {
                    setState(() {
                      selectedSport = value;
                      _curSport[0] = selectedSport.name;
                      _curSport[1] = selectedSport.color;
                    });
                  },
                  items: colorList.map<DropdownMenuItem<Item>>((Item item) {
                    return DropdownMenuItem<Item>(
                      value: item,
                      child: SizedBox(
                        width: 100,
                        child: Text(item.name),
                      ),
                    );
                  }).toList(),
                ),
                backgroundColor: _curSport[1],
                actions: <Widget>[
                  Switch(
                    value: Provider
                        .of<ThemeState>(context)
                        .theme == ThemeType.DARK,
                    onChanged: (value) {
                      Provider.of<ThemeState>(context)
                          .theme =
                            value ? ThemeType.DARK : ThemeType.LIGHT;
                      setState(() {});
                    },
                  ),
                ]),

            body: _children[_currentBodyIndex],

            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  _currentBodyIndex = index;
                });
              },
              currentIndex: _currentBodyIndex,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text("Home"),
                ),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.calendar_today),
                    title: new Text("Schedule")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.table_chart),
                    title: new Text("Scores")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.assessment),
                    title: new Text("Standings")),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.more_horiz), title: new Text("More"))
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
          ),
    );
  }
}

class Item {
  const Item(this.name, this.color);

  final String name;
  final Color color;
}