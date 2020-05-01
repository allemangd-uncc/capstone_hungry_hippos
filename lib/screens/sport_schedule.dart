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
    this.numCards = 1.75,
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
          'https://fiusports.com/images/logos/UNC-Charlotte.png?width=80&height=80&mode=max'
      ));
    } else {
      return (Image.network(
        'https://charlotte49ers.com' + opposingTeam,
      ));
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
        color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
        width: .5,
      ),
      borderRadius: BorderRadius.circular(12.0),
    );

    var body = Column(
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: ListTile(
            leading: SizedBox(
                //width: widthIn(ctx)/3 - 5,
                child: Container(decoration: decoration,child: _homeAwayImageOrder(
                gameCard.location_indicator,
                gameCard.image,
                true, ctx))),
            title: SizedBox(
              //width: widthIn(ctx)/3 - 5,
              child: Container(decoration: decoration,child: Wrap(
                children: <Widget>[
                  if (gameCard.status == "null") // no game yet
                    Text(
                        '${_months[gameCard.date.month]} ${gameCard.date.day}')
                  else
                    _pastGameScore(
                        gameCard.location_indicator,
                        gameCard.status,
                        gameCard.team_score,
                        gameCard.opponent_score,),
                  ],
                ))
            ),
            trailing: SizedBox(
                //width: widthIn(ctx)/3 - 5,
                child: Container(decoration: decoration,child: _homeAwayImageOrder(
                    gameCard.location_indicator,
                    gameCard.image,
                    false, ctx))),
            onTap: () => print('${gameCard.date}'),
          ),
        ),
      ],
    );


    return SizedBox(
      width: widthIn(ctx),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: decoration,
          child: body,
        ),
      ),
    );
  }
}
