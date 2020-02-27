import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    /*  title: 'UNCC Sports app Demo',
      theme: ThemeData(

        primaryColor: Colors.lightGreen.shade900,
        accentColor: Colors.yellow.shade600,
      ),
      home: MyHomePage(title: 'UNCC Sports Demo Home Page'),*/
      debugShowCheckedModeBanner: false,
      title: 'UNCC Athletics',
      home: Home(),
    );
  }
}


