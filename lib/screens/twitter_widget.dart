import 'package:capstone_hungry_hippos/twitter_assets/twitterFeed.dart';
import 'package:flutter/material.dart';
import '../twitter_assets/tweet.dart';

class TwitterFeed extends StatelessWidget{
  final feed = TwitterFeedCreation();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text("49ers"),
              backgroundColor: Colors.green,
            ),
            body: Container(
              color: Colors.black12,
              child: VerticalTwitterFeed(twitterFeed: feed),
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
            )
        ));
  }
}

