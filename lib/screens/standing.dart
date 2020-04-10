import 'package:capstone_hungry_hippos/models/School.dart';
import 'package:flutter/material.dart';

class Standing extends StatelessWidget {
  final _schools = [
    School("North Texas Mean Green",AssetImage('assets/school_logos/NorthTexas.png'), 14, 4),
    School("Louisiana Tech Bulldogs",AssetImage('assets/school_logos/LT.png'), 13, 5),
    School("Western Kentucky Hilltoppers",AssetImage('assets/school_logos/wku.png'), 13, 5),
    School("Charlotte 49ers",AssetImage('assets/school_logos/uncc.png'), 10, 8),
    School("Marshall Thundering Herd",AssetImage('assets/school_logos/Marshall.png'), 10, 8),
    School("Florida Int'L Panthers",AssetImage('assets/school_logos/FIU.png'), 9, 9),
    School("UAB Blazers",AssetImage('assets/school_logos/UAB.png'), 9, 9),
    School("Old Dominion Monarchs",AssetImage('assets/school_logos/ODU.png'), 9, 9),
    School("Florida Atlantic Owl",AssetImage('assets/school_logos/FAU.png'), 8, 10),
    School("UTEP Miners",AssetImage('assets/school_logos/UTEP.png'), 8, 10),
    School("UTSA Roadrunners",AssetImage('assets/school_logos/UTSA.png'), 7, 11),
    School("Rice Owls",AssetImage('assets/school_logos/RiceOwls.png'), 7, 11),
    School("Southern Miss Golden Eagles",AssetImage('assets/school_logos/SouthernMiss.png'), 5, 13),
    School("Middle Tennessee Blue Raiders",AssetImage('assets/school_logos/MT.png'), 4, 14),
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
              child: Text(
                "W        L",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              alignment: Alignment(.85, 0),
              height: 20,
              color: Colors.grey,
            ),
            SportLine(
              s: _schools[0],
              position: 1,
            ),
            SportLine(
              s: _schools[1],
              position: 2,
            ),
            SportLine(
              s: _schools[2],
              position: 3,
            ),
            SportLine(
              s: _schools[3],
              position: 4,
            ),
            SportLine(
              s: _schools[4],
              position: 5,
            ),
            SportLine(
              s: _schools[5],
              position: 6,
            ),
            SportLine(
              s: _schools[6],
              position: 7,
            ),
            SportLine(
              s: _schools[7],
              position: 8,
            ),
            SportLine(
              s: _schools[8],
              position: 9,
            ),
            SportLine(
              s: _schools[9],
              position: 10,
            ),
            SportLine(
              s: _schools[10],
              position: 11,
            ),
            SportLine(
              s: _schools[11],
              position: 12,
            ),SportLine(
              s: _schools[12],
              position: 13,
            ),SportLine(
              s: _schools[13],
              position: 14,
            ),
          ],
        ),
      ),
    );
  }
}

class SportLine extends StatelessWidget {
  const SportLine({
    Key key,
    @required
    this.position,
    this.s
  }) : super(key: key);

  final School s;
  final int position;
  @override
  Widget build(BuildContext context) {
    int w = s.win;
    int l = s.loss;
    return Container(
        color: evenOdd(position),
        height: 60,
        child: Row(
          children: <Widget>[
            Container(
              height: 55,
              width: 20,
              //color: Colors.orange,
              child: Center(
                  child: Text(
                "$position",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
            Container(
              //color: Colors.blue,
              width: 55,
              child: Image(
                image: s.logo,
              ),
            ),
            Container(
              width: 5,
              //color: Colors.red,
            ),
            Container(
              //color: Colors.pinkAccent,
              width: 220,
              child: Text(s.name),
            ),
            Container(
                //color: Colors.orange,
                width: 35,
                child: Text(
                  "$w",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Container(
                //color: Colors.blue,
                width: 35,
                child: Text(
                  "   $l",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        )
    );
  }

  Color evenOdd(int i) {
    Color c = i % 2 == 0 ? Colors.black12 : Colors.white30;
    return c;
  }
}
