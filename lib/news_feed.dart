import 'package:flutter/material.dart';

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (ictx, iidx) {
              return NewsCard(height: height, width: width);
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
    @required this.height,
    @required this.width,
  }) : super(key: key);

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
              title: Text("no u"),
              trailing: Icon(Icons.more_horiz),
            ),
            Image.network(
              "https://pbs.twimg.com/media/ERFFfZpU4AAJmIy.jpg:small",
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
