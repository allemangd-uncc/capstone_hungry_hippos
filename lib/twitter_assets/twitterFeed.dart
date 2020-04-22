import 'dart:io';

import 'package:capstone_hungry_hippos/screens/twitter_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_api/twitter_api.dart';

import 'dart:convert';


import 'tweet.dart';


final twitterBase = 'https://api.twitter.com/1.1/search';

final _twitterOauth = new twitterApi(
    consumerKey: 'AFBfOqx8uXIUBZMxAFoQyO3zA',
    consumerSecret: '48Gp7nczz9SqExorwYuWpA6Nmviuox6Beq83kjH1XtYtunorym',
    token: '910563313108574211-NNlQlPdbHWlNyFglwzrtD1dMpyDrNrF',
    tokenSecret: 'aW4aJBQH2EPvoyc3gtR0qSKepccmuEtAj2sH7dzh2w8sN;',
);

Future twitterRequest = _twitterOauth.getTwitterRequest(
    "GET",
    "/statuses/user_timeline.json",
    options: {
      "user_id": "19025957",
      "screen_name": "TTCnotices",
      "count": "20",
      "trim_user": "true",
      "tweet_mode": "extended",
    }
);



class TwitterFeedCreation {


  Future<List<Tweet>> getPage() async {

    var response = await twitterRequest;
    Iterable tweets = json.decode(response.body);
    print(tweets);
    return tweets.map((e) => Tweet.fromJson(e)).toList();
  }
}


class VerticalTwitterFeed extends StatelessWidget{

  final  twitterFeed = TwitterFeedCreation();



  @override
  Widget build(BuildContext context) {

    /*
    return Container(
      child:  ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: twitterFeed.length,
        itemBuilder: (ctx, idx){
          return TwitterCard(
            tweet: twitterFeed[idx],
          );
        },
      ),
    ); */

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