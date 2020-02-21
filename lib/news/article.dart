import 'package:flutter/material.dart';

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

class ArticleCard extends StatelessWidget {
  const ArticleCard({
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
