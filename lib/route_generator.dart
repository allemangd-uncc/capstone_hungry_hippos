import 'models/game_details.dart';
import 'screens/chat.dart';
import 'screens/schedule.dart';
import 'screens/standing.dart';
import 'package:flutter/material.dart';
import 'screens/home_widget.dart';
import 'screens/sport.dart';
import 'screens/twitter_widget.dart';
import 'screens/favorites_reorder.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings
        .arguments; //This is how we pass arguments and can be used in case
    print("args $args");
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/Sport':
        //We can put logic and stuff here for checking if logged in
        return MaterialPageRoute(builder: (_) => Sport(args));
      case '/Schedule':
        return MaterialPageRoute(builder: (_) => Schedule(args));
      case '/Standing':
        return MaterialPageRoute(builder: (_) => Standing(args));
      case '/Chat':
        return MaterialPageRoute(builder: (_) => Chat(args));
      case '/Details':
        return MaterialPageRoute(builder: (_) => GameDetailsWidget(args));
      case '/Favorites':
        return MaterialPageRoute(builder: (_) => FavoritesManager());
      case '/Twitter':
        return MaterialPageRoute(builder: (_) => TwitterFeed());
      default:
        return _errorRoute();
    }
  }
  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
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
