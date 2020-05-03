import 'package:flutter/material.dart';

class Chat extends StatelessWidget{
  String sport;
  Chat(this.sport);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text('$sport Chat'),
            backgroundColor: Colors.green,
          ),
          body: Center(child: Text("Chat Goes Here")),
        ));
  }
}