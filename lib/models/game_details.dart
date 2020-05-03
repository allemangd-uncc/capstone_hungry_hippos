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
      body: Column(
        children: <Widget>[
          GameDetailsHeader(gameCard),
          EasyAccess(gameCard),
          GameUpdates()
        ],
      )
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
    double fontsize = 25;
    if (homeAway == "H" || homeAway == "T") {
      return (Text('$uncc - $opponent',style: TextStyle(fontSize: fontsize)));
    } else {
      return (Text('$opponent - $uncc',style: TextStyle(fontSize: fontsize)));
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
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: _homeAwayImageOrder(
                    gameCard.location_indicator,
                    gameCard.image,
                    true, context),
              ),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          if (gameCard.status == null) // no game yet
                            Text(
                                '${_months[gameCard.date.month]} ${gameCard.date.day}',
                              style: TextStyle(fontSize: 25),
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
                    false, context),
              )
            ],
          ),
      )
    );
  }
}

class EasyAccess extends StatelessWidget {
  final sport_schedule gameCard;

  const EasyAccess(
      this.gameCard,
      );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 15,
      child: Container(
        //color: Colors.black12,
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
    return InkWell(
          splashColor: Colors.green,
          child: Container(
            width: size.width/2,
            height: size.height / 15,
            color: label == 'Play-by-Play' ? Colors.green : Colors.black12,
            child: Center(
              child: Text(label, style: TextStyle(fontSize: 16),),
            ),
          ),
          onTap: () => {
            print("Tapped $label"),
            if(label == 'Chat'){
              Navigator.pushNamed(context, '/Chat', arguments: [gameCard.sportTitle, gameCard.idSport])
            }
          },
    );
  }
}

//Class for pbp
class GameUpdates extends StatelessWidget{
  List<Play> myList = [];
  final test1 = new Play('1st and 10 at CLT 25', '(6:12 - 4th) Aidan Swanson kickoff for 65 yds for a touchback');
  final test2 = new Play('2nd & 10 at CLT 25', '(5:00 - 4th) Ishod Finger run for no gain to the Charl 25');
  final test3 = new Play('3rd & 10 at CLT 25', '(4:30 - 4th) CHARLOTTE Penalty, False Start (-5 Yards) to the Charl 20');
  final test4 = new Play('3rd & 15 at CLT 20', '(4:00 - 4th) Brett Kean run for 5 yds to the Charl 25');
  final test5 = new Play('4th & 10 at CLT 25', '(3:31 - 4th) Connor Bowler punt for 48 yds , Will Brown returns for 13 yds to the Clem 40');
  final test6 = new Play('1st & 10 at CLEM 40','(3:00 - 4th) Taisun Phommachanh pass complete to Will Brown for 8 yds to the Clem 48');
  final test7 = new Play('2nd & 2 at CLEM 48','(2:40 - 4th) Chez Mellusi run for 3 yds to the Charl 49 for a 1ST down');
  final test8 = new Play('1st & 10 at CLT 49','(2:25 - 4th) Chez Mellusi run for 8 yds to the Charl 41');
  final test9 = new Play('2nd & 2 at CLT 41','(1:37 - 4th) Ben Batson run for 5 yds to the Charl 36 for a 1ST down');
  final test10 = new Play('1st & 10 at CLT 36', '(1:30 - 4th) CLEMSON Penalty, False Start (-5 Yards) to the Charl 41');
  final test11 = new Play('1st & 15 at CLT 41','(0:55 - 4th) Chez Mellusi run for 4 yds to the Charl 37');
  final test12 = new Play('2nd & 11 at CLT 37','(0:25 - 4th) Patrick McClure run for 3 yds to the Charl 34');
  final test13 = new Play('3rd & 8 at CLT 34','(0:05 - 4th) Chez Mellusi run for 7 yds to the Charl 27');
  final test14 = new Play('4th & 1 at CLT 27','(0:00 - 4th) Patrick McClure run for 9 yds to the Charl 18 for a 1ST down');


  @override
  Widget build(BuildContext context) {

    myList.add(test1);
    myList.add(test2);
    myList.add(test3);
    myList.add(test4);
    myList.add(test5);
    myList.add(test6);
    myList.add(test7);
    myList.add(test8);
    myList.add(test9);
    myList.add(test10);
    myList.add(test11);
    myList.add(test12);
    myList.add(test13);
    myList.add(test14);

    return Expanded(
      child: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: myList.length,
            itemBuilder: (context, int index){
              return Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: ListTile(
                    title: Text('${myList[index].title}'),
                    subtitle: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text('${myList[index].action}'),
                    ),
                  ),
                ),
              );

            }
        ),
      ),
    );
  }
}

class Play {
  final String title;
  final String action;

  Play(
      this.title,
      this.action,
      );
}