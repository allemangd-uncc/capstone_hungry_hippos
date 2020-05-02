import 'package:capstone_hungry_hippos/screens/sport_schedule.dart';
import 'package:flutter/material.dart';


//This will mode to Kalebs
class GameDetailsWidget extends StatelessWidget {
  final sport_schedule gameCard;

  const GameDetailsWidget(this.gameCard);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VS. ${gameCard.opponentTitle}"),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          GameDetailsHeader(gameCard),
          EasyAccess(),
        ],
      ),
    );
  }
} //Move to Kalebs ^^^^

class GameDetailsHeader extends StatelessWidget {
  final sport_schedule gameCard;

  const GameDetailsHeader(
    this.gameCard,
  );

  Text _pastGameScore(
      String homeAway, String winLoss, String uncc, String opponent) {
    if (homeAway == "H" || homeAway == "T") {
      return (Text('$uncc - $opponent'));
    } else {
      return (Text('$opponent - $uncc'));
    }
  }

  Image _homeAwayImageOrder(
      String h, String opposingTeam, bool l, BuildContext ctx) {
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

  @override
  Widget build(BuildContext context) {
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
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 7,
      child: Container(
          color: Colors.black26,
          width: size.width,
          child: Center(
            child: ListTile(
              leading: SizedBox(
                  width: size.width / 3,
                  child: _homeAwayImageOrder(gameCard.location_indicator,
                      gameCard.image, true, context)),
              title: FittedBox(
                  fit: BoxFit.contain,
                  child: Wrap(
                    children: <Widget>[
                      if (gameCard.status == null) // no game yet
                        Text(
                            '${_months[gameCard.date.month]} ${gameCard.date.day}')
                      else
                        _pastGameScore(
                          gameCard.location_indicator,
                          gameCard.status,
                          gameCard.team_score,
                          gameCard.opponent_score,
                        ),
                    ],
                  )),
              subtitle: FittedBox(
                  fit: BoxFit.contain,
                  child: Wrap(
                    children: <Widget>[
                      if (gameCard.status != null) // no game yet
                        Text(
                          '${_months[gameCard.date.month]} ${gameCard.date.day}',
                          textAlign: TextAlign.center,
                        )
                      else
                        Text(
                            '${gameCard.date.hour}:${gameCard.date.minute} PM'),
                    ],
                  )),
              trailing: SizedBox(
                  width: size.width / 3,
                  child: _homeAwayImageOrder(gameCard.location_indicator,
                      gameCard.image, false, context)),
            ),
          )),
    );
  }
}

class EasyAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 15,
      child: Container(
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, "Play-by-Play"),
            _button(context, "Chat")
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context, String label) {
    var size = MediaQuery.of(context).size;
    label = (label == "Standings") ? "Standing" : label;
    print(label);
    var decoration = BoxDecoration(
      border: Border.all(
        color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
      ),
      borderRadius: BorderRadius.circular(5)
    );
    return Container(
      child: GestureDetector(
        onTap: () => print("clicked"),
        //Navigator.pushNamed(context, "/$label"),
        child: Card(
          child: SizedBox(
            width: size.width / 2.5,
            child: Container(
                decoration: decoration,
                child:Container(
                color: Colors.black12,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(label),
                ))),
          ),
        ),
      ),
    );
  }
}

//Class for pbp