import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:capstone_hungry_hippos/theme_state.dart';
import 'home_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeState>(
      create: (context) => ThemeState(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UNCC Athletics',
      theme: Provider.of<ThemeState>(context).theme == ThemeType.DARK
          ? ThemeData.dark()
          : ThemeData.light(),
      home: Home(),
    );
  }
}


