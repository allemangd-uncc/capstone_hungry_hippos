import 'package:flutter/material.dart';
import 'screens/home_widget.dart';
import 'screens/sport.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/Sport': (context) => Sport(),
      },
    );
  }
}
