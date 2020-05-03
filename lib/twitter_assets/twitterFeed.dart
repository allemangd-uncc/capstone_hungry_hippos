import 'dart:io';

import 'package:capstone_hungry_hippos/screens/twitter_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_api/twitter_api.dart';
import'package:crypto/crypto.dart';

import 'dart:convert';


import 'tweet.dart';


final twitterBase = 'https://api.twitter.com/1.1/search';

final _twitterOauth = new twitterApi(
    consumerKey: "gsa3eHPVGK90dt6fgUC2ZSbTE",
    consumerSecret: "rwEjykGOfapPLTVkWgedSCU8Eld130EEHFyu3W0Ye3fDcKj5V",
    token: "910563313108574211-WynoAeUKJrnE6uXPv8vJGx4ITGS1ggG",
    tokenSecret: "dWFYYbn6J1QTyV86femOdriX7MfMSANSjH3m48ZtEZUNW",
);



class TwitterFeedCreation {


  Future<List<Tweet>> getPage() async {


    var response = await _twitterOauth.getTwitterRequest(
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
    Iterable tweets = json.decode(response.body);
    print(tweets);
    return tweets.map((e) => Tweet.fromJson(e)).toList();

  }
}

String _getSig(String method, String base, List<String> sortedItems){
  String param = ''; 
  
  for (int i = 0; i < sortedItems.length; i++) {
    if (i == 0) {
      param = sortedItems[i];
    } else {
      param += '%${sortedItems[i]}';
    }
  }
  String sig = '$method&${Uri.encodeComponent(base)}&${Uri.encodeComponent(param)}';
  String key = '${Uri.encodeComponent("gsa3eHPVGK90dt6fgUC2ZSbTE")}&${Uri.encodeComponent("rwEjykGOfapPLTVkWgedSCU8Eld130EEHFyu3W0Ye3fDcKj5V")}';

  var digest = Hmac(sha1, utf8.encode(key)).convert(utf8.encode(sig));
  return base64.encode(digest.bytes);
}




class VerticalTwitterFeed extends StatelessWidget{

  final TwitterFeedCreation twitterFeed;

  const VerticalTwitterFeed({
    Key key,
    @required this.twitterFeed,
}) : super(key: key);



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