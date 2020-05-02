import 'package:flutter/material.dart';

class sport_schedule {
  final int id;               //id for each game
  final DateTime date;        //date: 2020-09-05T00:00:00
  final String location_indicator; //location_indicator: H-Home / A-Away
  final String location;      //location: Knoxville, Tenn., Charlotte, NC

  // -- sport json --
  final int idSport;          //id: Each sport different number
  final String sportTitle;    //title: Football, Men's Soccer
  final String gender;        //gender: M - F

  // -- opponent json --
  final String opponentTitle; //title: Tennessee, Norfolk State
  final String image;

  // -- result json --
  final String status;        //status: W - T - L
  final String team_score;       //team_score:
  final String opponent_score;   //opponent_score:
  final String postscore;

  sport_schedule(
      this.id, {
        this.date,
        this.location_indicator,
        this.location,

        this.idSport,
        this.sportTitle,
        this.gender,

        this.opponentTitle,
        this.image,

        this.status,
        this.team_score,
        this.opponent_score,
        this.postscore,
      });

  factory sport_schedule.fromJson(Map<String, dynamic> json) {
    return sport_schedule(
      json['id'],
      date: DateTime.parse(json['date']),
      location_indicator: json['location_indicator'],
      location: json['location'],

      idSport: json['sport']['id'],
      sportTitle: json['sport']['title'],
      gender: json['sport']['gender'],

      opponentTitle: json['opponent']['title'],
      image: json['opponent']['image'],

      status: json['result']['status'],

      team_score: json['result']['team_score'],
      opponent_score: json['result']['opponent_score'],
      postscore: json['result']['postscore'],
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard({
    Key key,
    @required this.gameCard,
    this.numCards = 2.25,
  }) : super(key: key);

  final sport_schedule gameCard;
  final double numCards;

  double widthIn(BuildContext context) {
    return MediaQuery.of(context).size.width / numCards;
  }

  Text _pastGameScore(
      String homeAway, String winLoss, String uncc, String opponent) {
    if (homeAway == "H" || homeAway == "T") {
      return (Text('$uncc - $opponent'));
    } else {
      return (Text('$opponent - $uncc'));
    }
  }

  Image _homeAwayImageOrder(String h, String opposingTeam, bool l, BuildContext ctx) {
    if ((h == "H") == l) {
      return (Image.network(
          'https://fiusports.com/images/logos/UNC-Charlotte.png?width=80&height=80&mode=max',
      ));
    } else {
      return (Image.network(
        'https://charlotte49ers.com' + opposingTeam,
      ));
    }
  }

  Color winLoss(String wl){
    if (wl == "W") {
      return Colors.green;
    } else if (wl == "L") {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext ctx) {
    var _months = {
      1: 'JAN',
      2: 'FEB',
      3: 'MAR',
      4: 'APR',
      5: 'MAY',
      6: 'JUN',
      7: 'JUL',
      8: 'AUG',
      9: 'SEP',
      10: 'OCT',
      11: 'NOV',
      12: 'DEC'
    };
    var decoration = BoxDecoration(
      border: Border.all(
        color: winLoss(gameCard.status), //UNCC Green
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(2),
    );
    var logoWidth = 4.5;
    return SizedBox(
      width: widthIn(ctx),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: decoration,
          child: buildCard(ctx, logoWidth, _months),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext ctx, double logoWidth, Map<int, String> _months) {

      return GestureDetector(
          child: Container(
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                    child: _homeAwayImageOrder(
                        gameCard.location_indicator,
                        gameCard.image,
                        true, ctx),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          if (gameCard.status == null) // no game yet
                            Text(
                                '${_months[gameCard.date.month]} ${gameCard.date.day}'
                            )
                          else
                            _pastGameScore(
                              gameCard.location_indicator,
                              gameCard.status,
                              gameCard.team_score,
                              gameCard.opponent_score,),
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          if (gameCard.status != null) // no game yet
                            Text(
                                '${_months[gameCard.date.month]} ${gameCard.date.day}', textAlign: TextAlign.center,
                            )
                          else
                            Text('${gameCard.date.hour}:${gameCard.date.minute} PM'),
                        ],
                      )
                    ]
                  ),
                ),
                Expanded(
                  child: _homeAwayImageOrder(
                      gameCard.location_indicator,
                      gameCard.image,
                      false, ctx),
                )
              ],
            ),
          ),
        onTap: () => Navigator.pushNamed(ctx, '/Details', arguments: gameCard),
      );
  }
}
