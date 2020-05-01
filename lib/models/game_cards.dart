import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screens/sport_schedule.dart';
import 'dart:convert';

class GameCard extends StatefulWidget {
  final int sportID;

  GameCard(this.sportID);

  @override
  _SportsCard createState() => _SportsCard(sportID);
}

//List<sport_schedule> _selectedEvents; //original that makes events work
List
    _selectedEvents; //Removing the <sport_schedule> allows it to still work. Proceed with caution
DateTime selectedDay;
Map<DateTime, List<sport_schedule>> _events;

class _SportsCard extends State<GameCard> with TickerProviderStateMixin {
  int sportID;

  _SportsCard(this.sportID);

  AnimationController _animationController;

  static final sportUrl =
      'https://charlotte49ers.com/services/adaptive_components.ashx?type=scoreboard&start=0&count=80';

  Future<List<sport_schedule>> getEvents() async {
    var url = '$sportUrl&sport_id=$sportID&name=&extra=%7B%7D';

    http.Response response = await http.get(url);
    Iterable games = json.decode(response.body);

    return games
        .map<sport_schedule>((json) => sport_schedule.fromJson(json))
        .toList();
    //return games.map((e) => sport_schedule.fromJson(e)).toList();
  }

  Future<Map<DateTime, List<sport_schedule>>> getGames() async {
    Map<DateTime, List<sport_schedule>> mapGrab = {};

    List<sport_schedule> eventInfo = await getEvents();

    for (int i = 0; i < eventInfo.length; i++) {
      var sportEvent = DateTime(eventInfo[i].date.year, eventInfo[i].date.month,
          eventInfo[i].date.day);
      var original = mapGrab[sportEvent];

      if (original == null) {
        //print("null");
        mapGrab[sportEvent] = [eventInfo[i]];
      } else {
        //print(eventInfo[i].date);
        mapGrab[sportEvent] = List.from(original)..addAll([eventInfo[i]]);
      }
    }
    return mapGrab;
  }

  @override
  void initState() {
    //final _selectedDay = DateTime.now();

    //_selectedEvents = _events[_selectedDay] ?? [];
    _selectedEvents = [];
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getGames().then((val) => setState(() {
            _events = val;
          }));
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //----- Builds event Lister -----
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Expanded(child: _eventLister()),
      ),
    );
  }

  //----- Creates event display -----

  Text _pastGameScore(
      String homeAway, String winLoss, String uncc, String opponent) {
    if (homeAway == "H" || homeAway == "T") {
      return (Text('$uncc - $opponent'));
    } else {
      return (Text('$opponent - $uncc'));
    }
  }

  Image _homeAwayImageOrder(String h, String opposingTeam, bool l) {
    if ((h == "H") == l) {
      return (Image(
        image: AssetImage('assets/school_logos/uncc.png'),
        width: 50,
      ));
    } else {
      return (Image.network(
        'https://charlotte49ers.com' + opposingTeam,
        width: 50.0,
      ));
    }
  }

  Widget _eventLister() {
    var _months = {1:'JAN', 2:'FEB', 3:'MAR', 4:'APR', 5:'MAY', 6:'JUN',
      7:'JUL', 8:'AUG', 9:'SEP', 10:'OCT', 11:'NOV', 12:'DEC'};
    return SizedBox(
      height: 62,
      child: Column(
        children: _selectedEvents
            .map((event) => Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          height: 70.0,
          margin:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            leading: _homeAwayImageOrder(
                event.location_indicator.toString(),
                event.image.toString(), true),
            title: Wrap(
              children: <Widget>[
                if (event.status.toString() == "null") // no game yet
                  Text(
                      '${_months[event.date.month]} ${event.date.day.toString()}')
                else
                  _pastGameScore(
                      event.location_indicator.toString(),
                      event.status.toString(),
                      event.team_score.toString(),
                      event.opponent_score.toString()),
              ],
            ),

            //Type of sport - Location
            subtitle: Wrap(children: <Widget>[
              //Should be either live time or time game will be, nothing for past games
            ]),

            trailing: _homeAwayImageOrder(
                event.location_indicator.toString(),
                event.image.toString(), false),
            onTap: () =>
                print('${event.date}'), //When event display is clicked
          ),
        ))
            .toList(),
      ),
    );
  }
}


