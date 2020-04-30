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
  final Text title;
  final double numCards;
  final String sportFilter;

  const HorizontalNewsFeed({
    Key key,
    @required this.newsFeed,
    @required this.title,
    @required this.sportFilter,
    this.numCards = 3.25,
  }) : super(key: key);

  double heightIn(BuildContext context) {
    return MediaQuery.of(context).size.height / numCards;
  }
  @override
  Widget build(BuildContext context) {
    var page = newsFeed.getPage(1, size: 100).then((page) => page.where((article) => article.sport.toLowerCase().contains(sportFilter.toLowerCase())).toList());

    return SizedBox(
      height: heightIn(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: title,
            trailing: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context).pushNamed('/Sport', arguments: title.data),


              /*onPressed: () { //changed
                Navigator.of(context).pushNamed('/Sport');
                print(Navigator.of(context).pushNamed('/Sport'));
              }*/

            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: page,
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
