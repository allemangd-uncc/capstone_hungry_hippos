import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'article.dart';

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
    @required this.newsFeed,
    @required this.title,
  }) : super(key: key);

  final Feed newsFeed;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.25;
    var height = width * .6;

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
