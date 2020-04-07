import 'package:flutter/material.dart';

class TwitterFeed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text("49ers"),
              backgroundColor: Colors.green,
            ),
            body: Container(
              color: Colors.black12,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, ind){
                    return Card(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text('Twitter User'),
                        subtitle: Text('Tweet: I really hope I can figure out the whole URl thing what if this is longer and stuff. will it wrap around? I hope so we about to find out'),
                      ),
                    );
                  }
              ),
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
                    title: IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () => Navigator.pushNamed(context, '/'),
                    ),
                  ),
                ],
              ),
            )
        ));
  }
}

