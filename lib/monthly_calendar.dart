import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:table_calendar/table_calendar.dart';

import 'screens/sport_schedule.dart';
import 'screens/sport.dart' as globals;
import 'dart:convert';

class Calendar extends StatefulWidget {
  @override
  _Calendar createState() => _Calendar();
}

List<sport_schedule> _selectedEvents;
DateTime selectedDay;
Map<DateTime, List<sport_schedule>> _events;

class _Calendar extends State<Calendar> with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calController;

  int sportID = globals.Sport.sport_ID;
  static final sportUrl = 'https://charlotte49ers.com/services/adaptive_components.ashx?type=scoreboard&start=0&count=80';

  Future<List<sport_schedule>> getEvents() async {
    var url = '$sportUrl&sport_id=$sportID&name=&extra=%7B%7D';

    //print(url); //temp

    http.Response response = await http.get(url);
    Iterable games = json.decode(response.body);

    return games.map<sport_schedule>((json) => sport_schedule.fromJson(json)).toList();
    //return games.map((e) => sport_schedule.fromJson(e)).toList();
  }

  Future<Map<DateTime, List<sport_schedule>>> getGames() async {
    Map<DateTime, List<sport_schedule>> mapGrab = {};

    List<sport_schedule> eventInfo = await getEvents();

    for (int i = 0; i < eventInfo.length; i++) {
      var sportEvent = DateTime(
          eventInfo[i].date.year,
          eventInfo[i].date.month,
          eventInfo[i].date.day
      );
      var original = mapGrab[sportEvent];

      if (original == null) {
        //print("null");
        mapGrab[sportEvent] = [eventInfo[i]];
      } else {
        //print(eventInfo[i].date);
        mapGrab[sportEvent] = List.from(original)..addAll([eventInfo[i]]);
      }
      //print([eventInfo[i].opponentTitle]); //temp
    }
    return mapGrab;
  }

  @override
  void initState() {
    final _selectedDay = DateTime.now();

    //_selectedEvents = _events[_selectedDay] ?? [];
    _selectedEvents = [];
    _calController = CalendarController();

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
    _calController.dispose();
    super.dispose();
  }

  void _DaySelected(DateTime day, List<sport_schedule> events) {
    setState(() {
      _selectedEvents = events;
      selectedDay = DateTime(day.year, day.month, day.day);
    });
  }

  /*void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }*/

  //----- Builds calendar and event Lister -----
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _buildCalendar(),
          const SizedBox(height: 8.0),
          Expanded(child: _eventLister()),
        ],
      ),
    );
  }

  //----- Builds calendar -----
  @override
  Widget _buildCalendar() {
    return TableCalendar(
      calendarController: _calController,
      initialCalendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      //availableGestures: AvailableGestures.all,
      events: _events,

      availableCalendarFormats: const {
        CalendarFormat.month: '',
      },

      calendarStyle: CalendarStyle(
        outsideWeekendStyle: TextStyle(
          color: Colors.grey,
        ),

        weekendStyle: TextStyle(
          color: Colors.black,
        ),
      ),

      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(
            color: Colors.black,
          ),
          weekdayStyle: TextStyle(
            color: Colors.black,
          ),
      ),

      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false, //hides button that formats between 1 week, 2 week, month
        //formatButtonShowsNext: false,
      ),

      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,

            decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
                ),
                color: Color.fromRGBO(179, 163, 105, 1), //UNCC Gold
                borderRadius: BorderRadius.circular(10.0)
            ),

            child: Text(
              '${date.day}',
              style: TextStyle(color: Colors.white),
            ),
          );
        },

        todayDayBuilder: (context, date, _) {

          return Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,

              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
                  ),
                  borderRadius: BorderRadius.circular(10.0)
              ),

              child: Text(
                '${date.day}',
                style: TextStyle(
                    color: Colors.black,
                ),
              ),
          );
        },

        markersBuilder: (context, date, events, holidays) {
          final miniBox = <Widget>[];

          if (events.isNotEmpty) {
            miniBox.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          return miniBox;
        },
      ),

      onDaySelected: (date, events) {
        _DaySelected(date, events);
        _animationController.forward(from: 0.0);
      },

      //onVisibleDaysChanged: _onVisibleDaysChanged,
      //onCalendarCreated: _onCalendarCreated,

    );
  }

  //----- Creates event box display (mini box) -----
  Widget _buildEventsMarker(DateTime date, List events) {
    children: _selectedEvents.map((event) => AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      decoration: BoxDecoration(
        shape: BoxShape.rectangle,

        /*border: _calController.isSelected(date) //if selected date
            ? Border.all(color: Colors.black, width: 1.5,)
            : _calController.isToday(date) //if today's date
            ? Border.all(color: Colors.black, width: 1.5,)
            : Border.all(color: Colors.black, width: 0,),*/

        //color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
        //color: Colors.grey,

        color: _calController.isSelected(date) //if selected date
            ? Colors.blue[400]
            : Color.fromRGBO(0, 112, 60, 1), //UNCC Green
            //: Colors.grey,
      ),

      width: 16.0,
      height: 16.0,

      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    ));
  }

  //----- Creates event display -----
  Widget _eventLister() {
    return ListView(
      children: _selectedEvents.map((event) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green
            width: 0.8,
          ),

          borderRadius: BorderRadius.circular(12.0),
        ),

        height: 70.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),

        child: ListTile(
          leading: Icon(Icons.accessible), //opponent logo - Not done
          title: Row(
            children: <Widget>[
              if (event.location.toString() == "Charlotte, NC" || event.location.toString() == "Charlotte, N.C.")
                Text('vs. ') //home game
              else
                Text('at '), //away game

              Text(event.opponentTitle.toString()), //opponent name
            ],
          ),

          subtitle: Text(event.sportTitle.toString() + " - " + event.location.toString()), //Type of sport - Location

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //Game Result (W/L/T) - Not done
              /*if (event.status.toString() == "W")
                _buildGameResultWin()
              else if (event.status.toString() == "L")
                _buildGameResultLose()
              else if (event.status.toString() == "T")
                _buildGameResultTie()
              else
                Text('TBD')*/

            ],
          ),
          onTap: () => print('$event tapped!'), //When event display is clicked
        ),
      )).toList(),
    );
  }

  //----- Format to Game Result (W)-----
  Widget _buildGameResultWin() {
    children: _selectedEvents.map((event) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color.fromRGBO(0, 112, 60, 1),
      ),

      width: 15.0,
      height: 15.0,
      alignment: Alignment.center,

      child: Text(
        event.status.toString(), //Game Result (W-L-T)
        style: TextStyle().copyWith(
          color: Colors.white,
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }

  //----- Format to Game Result (L)-----
  Widget _buildGameResultLose() {
    children: _selectedEvents.map((event) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey,
      ),

      width: 15.0,
      height: 15.0,
      alignment: Alignment.center,

      child: Text(
        event.status.toString(), //Game Result (W-L-T)
        style: TextStyle().copyWith(
          color: Colors.black,
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }

  //----- Format to Game Result (T)-----
  Widget _buildGameResultTie() {
    children: _selectedEvents.map((event) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey,
      ),

      width: 15.0,
      height: 15.0,
      alignment: Alignment.center,

      child: Text(
        event.status.toString(), //Game Result (W-L-T)
        style: TextStyle().copyWith(
          color: Colors.black,
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}