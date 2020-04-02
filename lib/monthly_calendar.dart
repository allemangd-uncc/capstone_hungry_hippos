import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.add(Duration(days: 0)): ['Test'],
      _selectedDay.add(Duration(days: 5)): ['Example 1'],
      _selectedDay.add(Duration(days: 7)): ['Example 2'],
      _selectedDay.add(Duration(days: 14)): ['Example 3'],
      _selectedDay.add(Duration(days: 2)): ['Example 4'],
      _selectedDay.add(Duration(days: 27)): ['Example 5'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calController.dispose();
    super.dispose();
  }

  void _DaySelected(DateTime day, List events) {
    setState(() {
      _selectedEvents = events;
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
    return AnimatedContainer(
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
    );
  }

  //----- Format to Game Result -----
  Widget _buildGameResult() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color.fromRGBO(0, 112, 60, 1), //UNCC Green - if win
        //color: Colors.grey, // - if lose/tie
      ),

      width: 15.0,
      height: 15.0,
      alignment: Alignment.center,

      child: Text(
        'W', //Game Result (W-L-T)
         style: TextStyle().copyWith(
           color: Colors.white,          // - if win
           fontSize: 13.0,
           fontWeight: FontWeight.bold,

        /*'L', //Game Result (W-L-T)
        style: TextStyle().copyWith(
          color: Colors.black,          // - if lose/tie
          fontSize: 13.0,
          fontWeight: FontWeight.bold,*/
        ),
      ),
    );
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
          leading: Icon(Icons.accessible), //opponent logo
          title: Row(
            children: <Widget>[
              //Text('vs. '),              //home or away (vs. / @)
              Text('at '),                 //home or away (vs. / at)
              Text(event.toString()),
            ],
          ),

          //title: Text(event.toString()),
          subtitle: Text('Sport'),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Score '),
              _buildGameResult(), //Game Result (W-L)
              //Text('TBD'),

            ],
          ),
          onTap: () => print('$event tapped!'), //When event display is clicked
        ),
      ))
          .toList(),
    );
  }
}

class TextScore { //Displays score of game
  String team;
  String opponent;

  TextScore({String this.team, String this.opponent});

  @override
  String toString() => team + " - " + opponent;
}