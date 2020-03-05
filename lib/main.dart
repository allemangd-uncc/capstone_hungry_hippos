import 'package:capstone_hungry_hippos/route_generator.dart';
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
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
