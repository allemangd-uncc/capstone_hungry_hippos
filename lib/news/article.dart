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

  factory Article.fromJson(Map<String, dynamic> json) {
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
    this.numCards = 1.25,
  }) : super(key: key);

  final Article article;
  final double numCards;

  double widthIn(BuildContext context) {
    return MediaQuery.of(context).size.width / numCards;
  }

  @override
  Widget build(BuildContext context) {
    var decoration = BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          article.thumbUrl,
        ),
        fit: BoxFit.cover,
      ),
    );

    var body = Column(
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text(
              article.mediumHeadline,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );

    return SizedBox(
      width: widthIn(context),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: decoration,
          child: body,
        ),
      ),
    );
  }
}
