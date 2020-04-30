import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screens/sport_standings_basketball.dart';
import 'dart:convert';

class Team_Standings extends StatefulWidget {
  final int sportID;
  Team_Standings(this.sportID);

  @override
  _Standings createState() => _Standings(sportID);
}

List _selectedTeams;

class _Standings extends State<Team_Standings> {
  int sportID;
  String sportUrl;
  _Standings(this.sportID);

  Future<List<sport_standings_basketball>> getTeams() async {
    print(sportID);

    switch(sportID.toString()) {
      case "3" : { //football
        sportUrl = 'https://site.web.api.espn.com/apis/v2/sports/football/college-football/standings?region=us&lang=en&contentorigin=espn&group=12&level=3&sort=leaguewinpercent%3Adesc%2Cvsconf_wins%3Adesc%2Cvsconf_gamesbehind%3Aasc%2Cvsconf_playoffseed%3Aasc%2Cwins%3Adesc%2Closses%3Adesc%2Cplayoffseed%3Aasc%2Calpha%3Aasc';
        break;
      }
      case "5" : { //men basketball
        sportUrl = 'https://site.web.api.espn.com/apis/v2/sports/basketball/mens-college-basketball/standings?region=us&lang=en&contentorigin=espn&group=11&sort=playoffseed%3Aasc%2Cvsconf_winpercent%3Adesc%2Cvsconf_wins%3Adesc%2Cvsconf_losses%3Aasc%2Cvsconf_gamesbehind%3Aasc&includestats=playoffseed%2Cvsconf%2Cvsconf_gamesbehind%2Cvsconf_winpercent%2Ctotal%2Cwinpercent%2Chome%2Croad%2Cstreak%2Cvsaprankedteams%2Cvsusarankedteams';
        break;
      }
      case "13" : {
        sportUrl = 'https://site.web.api.espn.com/apis/v2/sports/basketball/womens-college-basketball/standings?region=us&lang=en&contentorigin=espn&sort=leaguewinpercent%3Adesc%2Cvsconf_winpercent%3Adesc%2Cvsconf_gamesbehind%3Aasc%2Cvsconf_playoffseed%3Aasc%2Cwins%3Adesc%2Closses%3Adesc%2Cplayoffseed%3Aasc%2Calpha%3Aasc&group=11';
        break;
      }
    }
    print(sportUrl.toString());

    http.Response response = await http.get(sportUrl);
    Iterable games = json.decode(response.body);

    return games.map((e) => sport_standings_basketball.fromJson(e)).toList();
  }

  @override
  void initState() {
    _selectedTeams = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _buildBasketballStandings(),
          //Expanded(child: _eventLister()),
        ],
      ),
    );
  }

  Widget _buildBasketballStandings() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(
            color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
          ),
          verticalInside: BorderSide(
            color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
          ),
          top: BorderSide(
            color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
          ),
          bottom: BorderSide(
            color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
          ),
        ),
        columnWidths: {0: FractionColumnWidth(.3), 1: FractionColumnWidth(.3), 2: FractionColumnWidth(.5)},
        children: [
          TableRow( children: [
            Column(children:[Text('')]),
            Column(children:[Text('Conference')]),
            Column(children:[Text('Overall')]),
          ]),
          TableRow( children: [
            Column(children:[Text('')]),
            Column(children:[Text('W-L    GB    PCT')]),
            Column(children:[Text('PCT    HOME    AWAY    STRK')]),
          ]),

          // ** Make loop based on number of teams **

        ],
      ),
    );
  }
}