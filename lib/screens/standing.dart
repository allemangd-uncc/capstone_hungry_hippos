import 'package:flutter/material.dart';

class Standing extends StatelessWidget {
  static const _teamName = [
    "North Texas Mean Green",
    "Louisiana Tech Bulldogs",
    "Western Kentucky Hilltoppers",
    "Charlotte 49ers",
    "Marshall Thundering Herd",
    "Florida Int'L Panthers",
    "UAB Blazers",
    "Old Dominion Monarchs",
    "Florida Atlantic Owls",
    "UTEP Miners",
    "UTSA Roadrunners",
    "Rice Owls",
    "Southern Miss Golden Eagles",
    "Middle Tennessee Blue Raiders",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("49ers"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child:  Text("W        L", style: TextStyle(fontWeight: FontWeight.bold),)
              , alignment: Alignment(.85, 0),
              height: 20,
              color: Colors.grey,
            ),
            SportLine(teamName: _teamName[0], position: 1, win: 12, loss: 4, logo: AssetImage('assets/school_logos/NorthTexas.png'),),
            SportLine(teamName: _teamName[1], position: 2, win: 12, loss: 4,logo: AssetImage('assets/school_logos/LouisianaBulldogs.png'),),
            SportLine(teamName: _teamName[2], position: 3, win: 12, loss: 4,logo: AssetImage('assets/school_logos/wku.png'),),
            SportLine(teamName: _teamName[3], position: 4, win: 12, loss: 4,logo: AssetImage('assets/school_logos/uncc.png'),),
            SportLine(teamName: _teamName[4], position: 5, win: 12, loss: 4,logo: AssetImage('assets/school_logos/Marshal.png'),),
            SportLine(teamName: _teamName[5], position: 6, win: 12, loss: 4,logo: AssetImage('assets/school_logos/FIU.png'),),
            SportLine(teamName: _teamName[6], position: 7, win: 12, loss: 4,logo: AssetImage('assets/school_logos/UAB.png'),),
            SportLine(teamName: _teamName[7], position: 8, win: 12, loss: 4,logo: AssetImage('assets/school_logos/ODU.png'),),
            SportLine(teamName: _teamName[8], position: 9, win: 12, loss: 4,logo: AssetImage('assets/school_logos/FloridaOwls.png'),),
            SportLine(teamName: _teamName[9], position: 10, win: 12, loss: 4,logo: AssetImage('assets/school_logos/UTEP.png'),),
            SportLine(teamName: _teamName[10], position: 11, win: 12, loss: 4,logo: AssetImage('assets/school_logos/UTSA.png'),),
            SportLine(teamName: _teamName[11], position: 12, win: 12, loss: 4,logo: AssetImage('assets/school_logos/RiceOwls.png'),),
            SportLine(teamName: _teamName[12], position: 13, win: 12, loss: 4,logo: AssetImage('assets/school_logos/SouthernMiss.png'),),
            SportLine(teamName: _teamName[13], position: 14, win: 12, loss: 4,logo: AssetImage('assets/school_logos/MT.png'),),
          ],
        ),
      ),
    );
  }
}

class SportLine extends StatelessWidget {
  const SportLine({
    Key key,
    @required this.teamName, this.position, this.win, this.loss, this.logo,
  }) : super(key: key);

  final int position;
  final String teamName;
  final int win;
  final int loss;
  final AssetImage logo;


  @override
  Widget build(BuildContext context) {
//    return Container(
//      child:  Text("$position  " + teamName)
//      , alignment: Alignment(-1, 0),
//      height: 55,
//      color: evenOdd(position),
//    );
    return Row(
      children: <Widget>[
        Container(
          height: 55,
          width: 20,
          child: Center(
              child: Text("$position", style: TextStyle(fontWeight: FontWeight.bold),)
          ),
        ),
        Container(
          width: 55,
          child: Image(
            image: logo,
          ),
        ),
        Container(width: 5,),
        Container(
          width: 255,
          child: Text(teamName),
        ),
        Container(
          width: 35,
            child:  Text("$win", style: TextStyle(fontWeight: FontWeight.bold),)
        ),
        Container(
          width: 35,
            child:  Text("   $loss", style: TextStyle(fontWeight: FontWeight.bold),)
        )
      ],
    );
  }

  Color evenOdd(int i) {
    Color c = i % 2 == 0 ? Colors.grey : Colors.white30;
    return c;
  }
}

