import 'package:flutter/material.dart';
import '../news/feed.dart';
import '../models/game_cards.dart';

class Sport extends StatelessWidget {
  static final List<Item> colorList = <Item>[
    const Item('Football', Colors.green,[3]),
    const Item("Basketball", Colors.red,[5,13]),
    const Item("Soccer", Colors.pinkAccent,[9,17]),
    const Item('Baseball', Colors.orange,[1]),
    const Item('Softball', Colors.yellow,[12]),
    const Item('Volleyball', Colors.blue,[20]),
    const Item('Tennis', Colors.yellowAccent,[10,18]),
  ];

  final feed = Feed(); // was var not final
  final gameCard = GameCardFeed();

  final String imageMale = 'images/male.png';
  final String imageFemale = 'images/female.png';
  static bool genderSportSwitch = false; //determines if sport needs the gender switch
  static bool genderSport = false; //determines which gender switch is set M - false / F - True
  static int sport_ID;
  final String sport;
  Sport(this.sport);

  Item _curSport = colorList[0];

  @override
  Widget build(BuildContext context) {
    Item _setDefault(){
      Item _curSport;
      for (Item i in colorList){
        if (i.name == sport){
          _curSport = i;
          break;
        }
      }
      return _curSport;
    }
    _curSport = _setDefault();
    sport_ID = _curSport.sportID[0];
    Item selectedSport;
    _genderSwitcherCheck();
    return StatefulBuilder(
      builder: (context, StateSetter setState) => Scaffold(
        appBar: AppBar(
            centerTitle: false,
            title: buildDropdownButton(selectedSport, setState),
            backgroundColor: _curSport.color,

            //--Gender Switch--  Need to make condition to determine gender
            actions: <Widget>[
              if (genderSportSwitch)
                Switch(
                  value: genderSport,
                  onChanged: (value) {
                    setState(() {
                      genderSport = value;
                      _genderSwitcherCheck();
                    });
                  },
                  inactiveThumbColor: Colors.lightBlue,
                  inactiveThumbImage: Image.asset(imageMale).image,

                  activeColor: Colors.pinkAccent,
                  activeThumbImage: Image.asset(imageFemale).image,
                ),
            ]
        ),
        body: ListView(
          children: <Widget>[
            HorizontalGameCards(gameCard: gameCard, sportID: sport_ID,),
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name), sportFilter: _curSport.name,),
          ],
        ),
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
              ListTile(
                title: IconButton(
                  icon: Icon(Icons.table_chart),
                  onPressed: () => Navigator.pushNamed(context, '/Standing', arguments: [sport_ID, _curSport.name]),
                ),
              ),
              ListTile(
                title: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => Navigator.pushNamed(context, '/Schedule',arguments: [sport_ID, _curSport.name],),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonHideUnderline buildDropdownButton(Item selectedSport, StateSetter setState) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<Item>(
        value: selectedSport,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 28,
        style: TextStyle(color: Colors.black, fontSize: 28),
        iconEnabledColor: Colors.white,
        hint: Text(
          _curSport.name,
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        onChanged: (Item value) {
          setState(() {
            _curSport = value;
            _genderSwitcherCheck();
            print(sport_ID);
          });
        },
        items: colorList.map<DropdownMenuItem<Item>>((Item item) {
          return DropdownMenuItem<Item>(
            value: item,
            child: SizedBox(
              child: Text(item.name),
              width: 150,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _genderSwitcherCheck() {
    if (_curSport.name == "Soccer" || _curSport.name == "Basketball" || _curSport.name == "Tennis" ){
      genderSportSwitch = true;
      sport_ID = genderSport ? _curSport.sportID[1] : _curSport.sportID[0];
    } else {
      genderSportSwitch = false;
      sport_ID = _curSport.sportID[0];
    }
    print(sport_ID);
  }
}

class Item {
  const Item(this.name, this.color, this.sportID);

  final String name;
  final Color color;
  final List<int> sportID;
}