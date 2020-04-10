import 'package:capstone_hungry_hippos/screens/favorites_reorder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../news/feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _buildList(),
        builder: (ctx, snap) {
          if (snap.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                _AppBar(),
                SliverList(delegate: SliverChildListDelegate(snap.data)),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
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
            ListTile(
              title: IconButton(
                icon: Icon(Icons.voice_chat),
                onPressed: () => Navigator.pushNamed(context, '/Twitter'),
              ),
            ),
            ListTile(
              title: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () =>
                    Navigator.pushNamed(context, '/Favorites').then((e) {
                  setState(() {});
                }),
              ),
            )
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

Future<List<HorizontalNewsFeed>> _buildList() async {
  final feed = Feed();
  final mgr = Favorites();
  final sports = await mgr.get_favorites();

  return sports.map((sport) {
    return HorizontalNewsFeed(
      newsFeed: feed,
      title: Text(sport),
    );
  }).toList();
}
