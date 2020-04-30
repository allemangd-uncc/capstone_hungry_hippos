import 'package:flutter/material.dart';

class sport_standings_basketball {
  final int id;
  final String displayName;
  final String image;

  /*final String position;

  // -- Conference stats --
  final String conferenceRecord;
  final String gamesBehind;
  final String conferencePercentRecord;

  // -- Overall stats --
  final String overallRecord;
  final String overallPercentRecord;
  final String homeRecord;
  final String awayRecord;
  final String gameStreak;*/

  // -- Polls stats --
  //final String apRecord;
  //final String usaRecord;

  sport_standings_basketball(
      this.id, {
        this.displayName,
        this.image,

        /*this.position,

        this.conferenceRecord,
        this.gamesBehind,
        this.conferencePercentRecord,

        this.overallRecord,
        this.overallPercentRecord,
        this.homeRecord,
        this.awayRecord,
        this.gameStreak,*/

        //this.apRecord,
        //this.usaRecord,
      });

  factory sport_standings_basketball.fromJson(Map<String, dynamic> json) {
    return sport_standings_basketball(
      json['id'],
      displayName: json['standings']['entries']['team']['displayName'],
      image: json['standings']['entries']['team']['logos']['href'],

      /*for (team in json['standings']['entries']) {
        var stats = new Map<String, dynamic>();
        for (stat in team['stats']) {
          stats[stat['type']] = stat;
        }

        var team_widget = basketball_widget(
          position: stats['playoffseed']['displayValue'],

          conferenceRecord: stats['vsconf']['displayValue'],
          gamesBehind: stats['vsconf_gamesbehind']['displayValue'],
          conferencePercentRecord: stats['vsconf_winpercent']['displayValue'],


          overallRecord: stats['total']['displayValue'],
          overallPercentRecord: stats['winpercent']['displayValue'],
          homeRecord: stats['home']['displayValue'],
          awayRecord: stats['road']['displayValue'],
          gameStreak: stats['streak']['displayValue'],

          //apRecord: json['standings']['entries']['stats']['displayValue'],
          //usaRecord: json['standings']['entries']['stats']['displayValue'],
        )
      }*/
    );
  }
}

class StandingsCard extends StatelessWidget {
  const StandingsCard({
    Key key,
    @required this.team,
  }) : super(key: key);

  final sport_standings_basketball team;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListTile(
          leading: Image.network(
            team.image,
            width: 35.0,
          ),
          title: Text(
            team.displayName,
          ),
          //decoration: decoration,
          //child: body,
        ),
      ),
    );
  }
}