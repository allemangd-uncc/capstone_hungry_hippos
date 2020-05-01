import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screens/sport.dart';

class HorizontalStandings extends StatelessWidget {
  static final standingsUrls = {
    "football": [
      "https://site.web.api.espn.com/apis/v2/sports/football/college-football/standings?region=us&lang=en&contentorigin=espn&group=12&sort=leaguewinpercent%3Adesc%2Cvsconf_wins%3Adesc%2Cvsconf_gamesbehind%3Aasc%2Cvsconf_playoffseed%3Aasc%2Cwins%3Adesc%2Closses%3Adesc%2Cplayoffseed%3Aasc%2Calpha%3Aasc",
    ],
    "basketball": [
      "https://site.web.api.espn.com/apis/v2/sports/basketball/mens-college-basketball/standings?region=us&lang=en&contentorigin=espn&group=11&sort=leaguewinpercent%3Adesc%2Cvsconf_wins%3Adesc%2Cvsconf_gamesbehind%3Aasc%2Cvsconf_playoffseed%3Aasc%2Cwins%3Adesc%2Closses%3Adesc%2Cplayoffseed%3Aasc%2Calpha%3Aasc",
      "https://site.web.api.espn.com/apis/v2/sports/basketball/womens-college-basketball/standings?region=us&lang=en&contentorigin=espn&group=11&sort=leaguewinpercent%3Adesc%2Cvsconf_wins%3Adesc%2Cvsconf_gamesbehind%3Aasc%2Cvsconf_playoffseed%3Aasc%2Cwins%3Adesc%2Closses%3Adesc%2Cplayoffseed%3Aasc%2Calpha%3Aasc",
    ],
  };

  final String sportName;

  const HorizontalStandings({Key key, this.sportName}) : super(key: key);

  Future<Widget> getStandingsTable(String url) async {
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body['children'].length == 0) body['children'] = [body];

    var res = Center(
      child: Column(
        children: <Widget>[
          Text(
            "${body['name']}",
            style: TextStyle(fontSize: 24),
          ),
          Column(
              children: body['children']
                  .map((conference) {
                    var teams = conference['standings']['entries'].map((team) {
                      var stats = {};
                      for (var stat in team['stats']) {
                        stats[stat['name']] = stat;
                      }

                      var source = team;

                      return {'stats': stats, 'source': source};
                    }).toList();

                    var interested = {
                      'football': ['vsConf', 'streak'],
                      'basketball': ['Season','streak']
                    }[sportName.toLowerCase()];

                    var table = Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: teams
                          .map((data) {
                            var stats = data['stats'];
                            var team = data['source'];

                            var row = interested
                                .map((e) => stats[e])
                                .where((e) => e != null)
                                .map((s) => Text("${s['displayValue']}"))
                                .cast<Widget>()
                                .toList();

                            row.insert(0, Text(team['team']['name']));
                            row.insert(
                                0,
                                Image.network(team['team']['logos'][0]['href'],
                                    height: 40));

                            return TableRow(children: row);
                          })
                          .cast<TableRow>()
                          .toList(),
                    );

                    return Column(
                      children: <Widget>[
                        Text(
                          conference['shortName'],
                          style: TextStyle(fontSize: 16),
                        ),
                        table,
                      ],
                    );
                  })
                  .cast<Widget>()
                  .toList()),
        ],
      ),
    );

    return res;
  }

  @override
  Widget build(BuildContext context) {
    var sportUrl = standingsUrls[sportName.toLowerCase()];
    var idx = (Sport.genderSportSwitch && Sport.genderSport) ? 1 : 0;
    var url = sportUrl[idx];

    return Center(
      child: Column(
        children: <Widget>[
          FutureBuilder<Widget>(
            future: getStandingsTable(url),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text(snapshot.error.toString());
              if (!snapshot.hasData) return CircularProgressIndicator();

              return snapshot.data;
            },
          )
        ],
      ),
    );
  }
}
