import 'dart:io';

import 'package:capstone_hungry_hippos/screens/twitter_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'tweet.dart';

class TwitterFeedCreation {
  static final twitterBase = 'https://api.twitter.com/1.1/search';

  static final apiKey = 'AFBfOqx8uXIUBZMxAFoQyO3zA';
  static final apiSecret = '48Gp7nczz9SqExorwYuWpA6Nmviuox6Beq83kjH1XtYtunorym';

  getToken() async {
    http.Response response = await http.get('https://api.twitter.com/oauth2/token',);
}

  Future<List<Tweet>> getPage({int size = 10}) async {
    var url = '$twitterBase/tweets.json?q=from%3ACharlotteFTBL&result_type=mixed&count=$size';
    http.Response response = await http.get(url,
      headers: <String, String> {}
    );
    Iterable tweets = json.decode(response.body);
    return tweets.map((e) => Tweet.fromJson(e)).toList();
  }
}


class VerticalTwitterFeed extends StatelessWidget{

  final TwitterFeedCreation twitterFeed;

  const VerticalTwitterFeed({
    Key key,
    @required this.twitterFeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: twitterFeed.getPage(),
        builder: (ctx, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }else{
            List<Tweet> tweets = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: tweets.length,
              itemBuilder: (ctx, idx) {
                return TwitterCard(
                  tweet: tweets[idx],
                );
              },
            );
          }
        },
      ),
    );
  }
}