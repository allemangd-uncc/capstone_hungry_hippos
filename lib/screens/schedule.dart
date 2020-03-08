import 'package:flutter/material.dart';

class Schedule extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text("49ers"),
              backgroundColor: Colors.green,
            ),
            body: Text("Schedule Goes Here"),
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