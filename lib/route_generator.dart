import 'package:capstone_hungry_hippos/screens/chat.dart';
import 'package:capstone_hungry_hippos/screens/schedule.dart';
import 'package:capstone_hungry_hippos/screens/standing.dart';
import 'package:flutter/material.dart';
import 'package:capstone_hungry_hippos/screens/home_widget.dart';
import 'package:capstone_hungry_hippos/screens/sport.dart';
import 'package:capstone_hungry_hippos/screens/game_details.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments; //This is how we pass arguments and can be used in case

    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/Sport':
        //We can put logic and stuff here for checking if logged in
        return MaterialPageRoute(builder: (_) => Sport());
      case '/Schedule':
        return MaterialPageRoute(builder: (_) => Schedule());
      case '/Standing':
        return MaterialPageRoute(builder: (_) => Standing());
      case '/Chat':
        return MaterialPageRoute(builder: (_) => Chat());
      case '/Details':
        return MaterialPageRoute(builder: (_) => Details());
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error Page"),
        ),
        body: Center(
          child: Text("Error Page"),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () => Navigator.pushNamed(_, '/'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
