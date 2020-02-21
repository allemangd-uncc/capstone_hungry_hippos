import 'package:flutter/material.dart';
import 'news/feed.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var feed = Feed();

    return Scaffold(
      appBar: AppBar(
        title: Text('UNCC Athletics App'),
      ),
      body: ListView(
        children: <Widget>[
          HorizontalNewsFeed(newsFeed: feed, title: Text("Basketball")),
          HorizontalNewsFeed(newsFeed: feed, title: Text("Soccer")),
          HorizontalNewsFeed(newsFeed: feed, title: Text("Football")),
          HorizontalNewsFeed(newsFeed: feed, title: Text("Volleyball")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today),
              title: new Text("Schedule")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.table_chart), title: new Text("Scores")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.assessment), title: new Text("Standings")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.more_horiz), title: new Text("More"))
        ],
      ),
    );
  }
}
