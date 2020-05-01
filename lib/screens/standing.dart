import 'package:flutter/material.dart';

import '../team_standings.dart';

class Standing extends StatelessWidget {
  final int sport_id;
  final String sport_name;

  Standing(List args)
      : sport_id = args[0],
        sport_name = args[1];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("$sport_name Standings"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: <Widget>[
            HorizontalStandings(sportName: sport_name,),
          ],
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
        ),
      ),
    );
  }
}
