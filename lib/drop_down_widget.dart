import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidget createState() => _DropDownWidget();
}

class _DropDownWidget extends State<DropDownWidget>{
  String curSport = "Men's Basketball";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: curSport,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      style: TextStyle(color: Colors.black),
      iconEnabledColor: Colors.white,
      onChanged: (String newSport) {
        setState(() {
          curSport = newSport;
        });
      },
      items: <String>["Men's Basketball", "Women's Basketball", "Baseball", "Softball", "FootBall"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SizedBox(
            width: 100,
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}