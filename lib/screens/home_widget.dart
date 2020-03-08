import 'package:flutter/material.dart';
import '../news/feed.dart';


class Home extends StatelessWidget {

  final feed = Feed(); //was var not final

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: Text("49ers"),
                backgroundColor: Colors.green,
              ),
              body: ListView(
                children: <Widget>[
                  HorizontalNewsFeed(newsFeed: feed, title: Text("Basketball")),
                  HorizontalNewsFeed(newsFeed: feed, title: Text("Soccer")),
                  HorizontalNewsFeed(newsFeed: feed, title: Text("Football")),
                  HorizontalNewsFeed(newsFeed: feed, title: Text("Volleyball")),
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
                          fontSize: 28,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () => Navigator.pushNamed(context, '/Chat'),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
