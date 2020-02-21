import 'package:flutter/material.dart';
import 'placeholder_widget.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HorizontalNewsFeed(title: Text("Basketball")),
          HorizontalNewsFeed(title: Text("Soccer")),
          HorizontalNewsFeed(title: Text("Football")),
        ],
      ),
      appBar: AppBar(
        title: Text("u mum gay"),
      ),
    );
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
    var width = MediaQuery.of(context).size.width / 2.25;
    var height = width * .6;

    return Column(
      children: <Widget>[
        Divider(),
        ListTile(
          title: title,
          trailing: IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              showDialog(
                context: context,
                child: Center(
                  child: Card(
                    elevation: 10,
                    child: Image.network(
                      "https://discordemoji.com/assets/emoji/ThinkNoose.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              );
            },
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
    return Container(
      height: height,
      width: width,
      child: Card(
        child: ListTile(
          title: Text("no u"),
        ),
      ),
    );
  }
}

//class _HomeState extends State<Home>{
//  int _currentIndex = 0;
//  final List<Widget> _children = [
//    ListView(
//      scrollDirection: Axis.vertical,
//      children: <Widget>[
//        Container(
//          height: 175,
//          margin: EdgeInsets.symmetric(vertical: 10),
//          child: ListView(
//            scrollDirection: Axis.horizontal,
//            children: <Widget>[
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.orange,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.orange,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.orange,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.orange,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.orange,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//        Container(
//          height: 175,
//          margin: EdgeInsets.symmetric(vertical: 10),
//          child: ListView(
//            scrollDirection: Axis.horizontal,
//            children: <Widget>[
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.green,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.green,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.green,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.green,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children:<Widget>[
//                      ListTile(
//                        leading: FlutterLogo(),
//                        title: Text('Testing Fancy Shit'),
//                      ),
//                      Expanded(
//                        child: Container(
//                          color: Colors.green,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//        Container(
//          height: 175,
//          margin: EdgeInsets.symmetric(vertical: 10),
//          child: ListView(
//            scrollDirection: Axis.horizontal,
//            children: <Widget>[
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.purple,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.purple,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.purple,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.purple,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.purple,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//        Container(
//          height: 175,
//          margin: EdgeInsets.symmetric(vertical: 10),
//          child: ListView(
//            scrollDirection: Axis.horizontal,
//            children: <Widget>[
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.blue,                ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.blue,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.blue,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.blue,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.blue,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//        Container(
//          height: 175,
//          margin: EdgeInsets.symmetric(vertical: 10),
//          child: ListView(
//            scrollDirection: Axis.horizontal,
//            children: <Widget>[
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.red,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.red,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.red,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.red,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                width: 325,
//                margin: EdgeInsets.symmetric(horizontal: 10),
//                child: Card(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.red,
//                        ),
//                      ),
//                      Text('Testing'),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//
//      ],
//    ),
//    PlaceholderWidget(Colors.orange),
//    PlaceholderWidget(Colors.blue),
//    PlaceholderWidget(Colors.red),
//    PlaceholderWidget(Colors.black38),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('UNCC Athletics App'),
//      ),
//      body: Container(child: _children[_currentIndex]),
//      bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.fixed,
//        items: [
//          BottomNavigationBarItem(
//            icon: new Icon(Icons.home),
//            title: new Text("Home"),
//          ),
//          BottomNavigationBarItem(
//              icon: new Icon(Icons.calendar_today),
//              title: new Text("Schedule")),
//          BottomNavigationBarItem(
//              icon: new Icon(Icons.table_chart), title: new Text("Scores")),
//          BottomNavigationBarItem(
//              icon: new Icon(Icons.assessment), title: new Text("Standings")),
//          BottomNavigationBarItem(
//              icon: new Icon(Icons.more_horiz), title: new Text("More"))
//        ],
//      ),
//    );
//  }
//}
