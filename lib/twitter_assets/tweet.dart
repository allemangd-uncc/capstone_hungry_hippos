import 'package:flutter/material.dart';

class Tweet {
  final int id;
  final String text;
  //final String userName;
  //final String userImgUrl;
  //final String url;

  Tweet(
      this.id, {
        this.text,
       // this.userName,
       // this.userImgUrl,
       // this.url,
      }
      );

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      json['id_str'],
      text: json['full_text'],
      //userName: json['user']['name'],
      //userImgUrl: json['user']['profile_image_url_https'],
      //url: json['urls']['expanded_url'],
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: ListTile(
            /* leading: SizedBox(
              height: 150,
              width: 75,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('${tweet.userImgUrl}'),
                  ),
                ),
              ),
            ), */
            // title: Text('${tweet.userName}'),
            title: Text('${tweet.text}'),
          ),
        ),
      );
  }
}

