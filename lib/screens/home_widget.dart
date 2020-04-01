import 'package:flutter/material.dart';
import '../news/feed.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _AppBar(),
          SliverList(delegate: SliverChildListDelegate(_buildList())),
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
            ListTile( //added by Kaleb to test details page. Will update path / delete when we have game tiles implemented.
              title: IconButton(
                icon: Icon(Icons.book),
                onPressed: () => Navigator.pushNamed(context, '/Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      title: Text("49ers"),
      backgroundColor: Colors.green,
    );
  }
}

List _buildList() {
  final feed = Feed();
  List<HorizontalNewsFeed> listItems = List();
  listItems.add(HorizontalNewsFeed(newsFeed: feed, title: Text("Football")));
  listItems.add(HorizontalNewsFeed(newsFeed: feed, title: Text("Soccer")));
  listItems.add(HorizontalNewsFeed(newsFeed: feed, title: Text("Basketball")));
  listItems.add(HorizontalNewsFeed(newsFeed: feed, title: Text("Volleyball")));
  listItems.add(HorizontalNewsFeed(newsFeed: feed, title: Text("Baseball")));
  listItems.add(HorizontalNewsFeed(newsFeed: feed, title: Text("Softball")));
  listItems.add(HorizontalNewsFeed(newsFeed: feed, title: Text("Tennis")));
  return listItems;
}
