import 'package:flutter/material.dart';
import '../placeholder_widget.dart';

class Home extends StatelessWidget {
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.red),
    PlaceholderWidget(Colors.black38),
  ];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: Text("49ers"),
              ),
              body: _children[4],
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.green,
                child: Icon(Icons.arrow_forward_ios),
                onPressed: () => Navigator.pushNamed(context, '/Sport'),
              ),
              drawer: Drawer(
                child: ListView(
                  children: <Widget>[
                    DrawerHeader(
                      child: Text(
                        'Drawer Header',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                    ),
                  ],
                ),
              ),
            ));
  }
}
