import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'article.dart';

class Feed {
  static final cobraBase = "https://www.ncaa.com/ncaa/cobra";

  Future<List<Article>> getPage(int page, {int size = 10}) async {
    var url = '$cobraBase/school-content/charlotte,$page,$size';
    http.Response response = await http.get(url);
    Iterable articles = json.decode(response.body);
    return articles.map((e) => Article.fromJson(e)).toList();
  }
}

class HorizontalNewsFeed extends StatelessWidget {
  final Feed newsFeed;
  final Widget title;
  final double numCards;

  const HorizontalNewsFeed({
    Key key,
    @required this.newsFeed,
    @required this.title,
    this.numCards = 3.25,
  }) : super(key: key);

  double heightIn(BuildContext context) {
    return MediaQuery.of(context).size.height / numCards;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightIn(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: title,
            trailing: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context).pushNamed('/Sport'),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: newsFeed.getPage(1),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Article> articles = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: articles.length,
                    itemBuilder: (ctx, idx) {
                      return ArticleCard(
                        article: articles[idx],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
