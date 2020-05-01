import 'package:flutter/material.dart';
import '../monthly_calendar.dart';

class Schedule extends StatelessWidget{

  final List sport;
  Schedule(this.sport);

  @override
  Widget build(BuildContext context) {
    var calendar = Calendar(sport[0]);
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text("${sport[1]}"),
              backgroundColor: Colors.green,
            ),
            body: Container (
              child: calendar,
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