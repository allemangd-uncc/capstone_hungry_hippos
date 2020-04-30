/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Standings extends StatefulWidget {
  @override
  _Standings createState() => _Standings();
}

List _selectedTeams;

class _Standings extends State<Standings> {
  static final sportUrl = 'https://charlotte49ers.com/services/adaptive_components.ashx?type=scoreboard&start=0&count=80';

  Future<List<sport_standings_basketball>> getEvents() async {
    var url = '$sportUrl&sport_id=$sportID&name=&extra=%7B%7D';

    print(url.toString());

    http.Response response = await http.get(url);
    Iterable games = json.decode(response.body);

    return games.map<sport_standings_basketball>((json) => sport_standings_basketball.fromJson(json)).toList();
    //return games.map((e) => sport_schedule.fromJson(e)).toList();
  }*/