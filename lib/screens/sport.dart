import 'package:flutter/material.dart';
import '../news/feed.dart';

class Sport extends StatelessWidget {

  static final List<Item> colorList = <Item>[
    const Item('FootBall', Colors.green),
    const Item("BasketBall", Colors.red),
    const Item("Soccer", Colors.pinkAccent),
    const Item('Baseball', Colors.orange),
  ];

  Item _curSport = colorList[0];

  final feed = Feed(); // was var not final

  bool genderSportSwitch = false; //determines if sport needs the gender switch
  final String imageMale = 'images/male.png';
  final String imageFemale = 'images/female.png';
  static bool genderSport = false; //determines which gender switch is set M - false / F - True

  static int sport_ID;

  @override
  Widget build(BuildContext context) {
    Item selectedSport;

    return StatefulBuilder(
      builder: (context, StateSetter setState) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: buildDropdownButton(selectedSport, setState),
          backgroundColor: _curSport.color,

            //--Gender Switch--  Need to make condition to determine gender
            actions: <Widget>[
              if (genderSportSwitch == true)
                Switch(
                  value: genderSport,
                  onChanged: (value) {
                    setState(() {
                      if (value == false) {
                        genderSport = false;
                      }
                      else {
                        genderSport = true;
                      }

                      print("value: " + value.toString());
                      print("gender: " + genderSport.toString());
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
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name)),
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name)),
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name)),
            HorizontalNewsFeed(newsFeed: feed, title: Text(_curSport.name)),
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
                  onPressed: () => Navigator.pushNamed(context, '/Standing'),
                ),
              ),
              ListTile(
                title: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => Navigator.pushNamed(context, '/Schedule'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonHideUnderline buildDropdownButton(
      Item selectedSport, StateSetter setState) {
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

            print("genderSport: " + genderSport.toString());

            //Will set the sport id / Display gender switch
            switch (_curSport.name) {   //prints are temp
              case 'FootBall':
                genderSportSwitch = false;
                sport_ID = 3;
                break;

              case 'BasketBall':
                genderSportSwitch = true;

                if (genderSport == false) {
                  sport_ID = 5; //Male
                }
                else {
                  sport_ID = 13; //Female
                }
                break;

              case 'Soccer':
                genderSportSwitch = true;

                if (genderSport == false) {
                  sport_ID = 9;    //Male
                }
                else {
                  sport_ID = 17;  //Female
                }
                break;

              case 'Baseball':
                genderSportSwitch = false;

                sport_ID = 1;
                break;
            }
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
}

class Item {
  const Item(this.name, this.color);

  final String name;
  final Color color;
}
