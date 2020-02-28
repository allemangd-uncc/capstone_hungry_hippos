import 'package:flutter/material.dart';
import '../news/feed.dart';

class Sport extends StatelessWidget {

  static final List<Item> colorList = <Item>[
    const Item('FootBall', Colors.green),
    const Item("BasketBall", Colors.red),
    const Item("Soccer", Colors.pinkAccent),
    const Item('Baseball', Colors.orange),
  ];

  Item _curSport = colorList[0];

  final feed = Feed(); // was var not final

  @override
  Widget build(BuildContext context) {
    Item selectedSport;

    return StatefulBuilder(
      builder: (context, StateSetter setState) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: buildDropdownButton(selectedSport, setState),
          backgroundColor: _curSport.color,
        ),
        body: ListView(
          children: <Widget>[
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name)),
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name)),
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name)),
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name)),
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
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonHideUnderline buildDropdownButton(
      Item selectedSport, StateSetter setState) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<Item>(
        value: selectedSport,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 28,
        style: TextStyle(color: Colors.black, fontSize: 28),
        iconEnabledColor: Colors.white,
        hint: Text(
          _curSport.name,
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        onChanged: (Item value) {
          setState(() {
            _curSport = value;
          });
        },
        items: colorList.map<DropdownMenuItem<Item>>((Item item) {
          return DropdownMenuItem<Item>(
            value: item,
            child: SizedBox(
              child: Text(item.name),
              width: 150,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  const Item(this.name, this.color);

  final String name;
  final Color color;
}
