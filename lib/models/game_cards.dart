import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:table_calendar/table_calendar.dart';

import '../screens/sport_schedule.dart';
import 'dart:convert';

class GameCardFeed{

  static final sportUrl =
      'https://charlotte49ers.com/services/adaptive_components.ashx?type=scoreboard&start=0&count=80';
  Future<List<sport_schedule>> getEvents(int sportID) async {
    var url = '$sportUrl&sport_id=$sportID&name=&extra=%7B%7D';
    http.Response response = await http.get(url);
    Iterable games = json.decode(response.body);
    return games
        .map<sport_schedule>((json) => sport_schedule.fromJson(json))
        .toList();
    //return games.map((e) => sport_schedule.fromJson(e)).toList();
  }
  Future<List<ScheduleObject>> getGames(int sportID) async {
    Map<DateTime, List<sport_schedule>> mapGrab = {};

    List<sport_schedule> eventInfo = await getEvents(sportID);

    for (int i = 0; i < eventInfo.length; i++) {
      var sportEvent = DateTime(eventInfo[i].date.year, eventInfo[i].date.month,
          eventInfo[i].date.day);
      var original = mapGrab[sportEvent];

      if (original == null) {
        //print("null");
        mapGrab[sportEvent] = [eventInfo[i]];
      } else {
        //print(eventInfo[i].date);
        mapGrab[sportEvent] = List.from(original)
          ..addAll([eventInfo[i]]);
      }
    }
    List<ScheduleObject> list = [];
    mapGrab.forEach((k, v) => list.add(ScheduleObject(k, v)));
    return list;
  }
}

class HorizontalGameCards extends StatelessWidget {
  final GameCardFeed gameCard;
  final double numCards;
  final int sportID;

  const HorizontalGameCards({
    Key key,
    @required this.gameCard,
    this.numCards = 8,
    this.sportID,
  }) : super(key: key);

  double heightIn(BuildContext context) {
    return MediaQuery.of(context).size.height / numCards;
  }

  @override
  Widget build(BuildContext context) {
    var card = gameCard.getGames(sportID);
    var events = [];
      return SizedBox(
        height: heightIn(context),//heightIn(context),
        child: FutureBuilder(
          future: card,
          // ignore: missing_return
          builder: (ctx, snapshot) {
            print(snapshot);
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              events = snapshot.data;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return GameCard(
                    gameCard: events[index].sportSched[0],
                  );
                },
              );
            }
          },
        ),
      );
    }
  }

class ScheduleObject {
  DateTime d;
  List<sport_schedule> sportSched;
  ScheduleObject(this.d, this.sportSched);
}






class GameCardTest extends StatelessWidget{
  final int sportID;
  GameCardTest(this.sportID);

  @override
  Widget build(BuildContext context) {
    final feed = GameCardFeed();
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text("49ers"),
              backgroundColor: Colors.green,
            ),
            body: HorizontalGameCards(gameCard: feed, sportID: sportID,),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  ListTile(
                    title: IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () => Navigator.pushNamed(context, '/'),
                    ),
                  ),
                ],
              ),
            )
        ));
  }
}