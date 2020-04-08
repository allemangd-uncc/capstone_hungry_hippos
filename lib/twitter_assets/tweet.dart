import 'package:flutter/material.dart';

class Tweet {
  final int id;
  final String text;
  final String userName;
  final String userImgUrl;
  final String url;

  Tweet(
      this.id, {
        this.text,
        this.userName,
        this.userImgUrl,
        this.url,
      });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      json['id_str'],
      text: json['text'],
      userName: json['user']['name'],
      userImgUrl: json['user']['profile_image_url_https'],
      url: json['urls']['expanded_url'],
    );
  }
}

class TwitterCard extends StatelessWidget{

  const TwitterCard({
    Key key,
    @required this.tweet,
  }) : super(key: key);

  final Tweet tweet;

    @override
    Widget build(BuildContext context) {
      return Card(
        child: ListTile(
          leading: SizedBox(
            width: 75,
            height: 75,
            child: Image.network('${tweet.userImgUrl}'),
          ),
          title: Text('${tweet.userName}'),
          subtitle: Text('${tweet.text}'),
        ),
      );
  }
}

