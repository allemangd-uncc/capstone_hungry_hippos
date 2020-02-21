import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Article {
  final int id;
  final String type;
  final String sport;
  final String title;
  final String mediumHeadline;
  final String url;
  final String summary;
  final String thumbUrl;

  Article(
    this.id, {
    this.type,
    this.sport,
    this.title,
    this.mediumHeadline,
    this.url,
    this.summary,
    this.thumbUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json,
      {String root = 'https://www.ncaa.com'}) {
    return Article(
      json['id'],
      type: json['type'],
      sport: json['sport'],
      title: json['title'],
      mediumHeadline: json['medium_headline'],
      url: json['url'],
      summary: json['summary'],
      thumbUrl: json['thumb']['url'],
    );
  }
}

class Feed {
  Future<List<Article>> getPage(int page, {int size = 10}) async {
    var url =
        'https://www.ncaa.com/ncaa/cobra/school-content/charlotte,$page,$size';
    http.Response response = await http.get(url);
    Iterable articles = json.decode(response.body);
    return articles.map((e) => Article.fromJson(e)).toList();
  }
}

class HorizontalNewsFeed extends StatelessWidget {
  const HorizontalNewsFeed({
    Key key,
    @required this.title,
  }) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.25;
    var height = width * .6;

    var feed = Feed();

    return Column(
      children: <Widget>[
        Divider(),
        ListTile(
          title: title,
          trailing: IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {},
          ),
        ),
        Container(
          height: height,
          child: FutureBuilder(
            future: feed.getPage(1),
            builder: (ctx, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                List<Article> articles = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: articles.length,
                  itemBuilder: (ctx, idx) {
                    return NewsCard(
                      article: articles[idx],
                      height: height,
                      width: width,
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    @required this.article,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final Article article;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Wrap(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            ListTile(
              title: Text(article.title),
              trailing: Icon(Icons.more_horiz),
            ),
            Image.network(
              article.thumbUrl,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
