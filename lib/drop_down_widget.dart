import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home_widget.dart';

class DropDownWidget extends StatefulWidget{
  @override
  _DropDownWidget createState() => _DropDownWidget();

}

class _DropDownWidget extends State<DropDownWidget>{
  Item selectedSport;
  String curSport;
  Color _appBarColor;
  List<Item> colorList = <Item>[
    const Item("Men's Basketball", Colors.red),
    const Item("Women's Basketball", Colors.pinkAccent),
    const Item('Baseball', Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Item>(
      value: selectedSport,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      style: TextStyle(color: Colors.black),
      iconEnabledColor: Colors.white,
      onChanged: (Item value) {
        setState(() {
          selectedSport = value;
          curSport = selectedSport.name;
          _appBarColor = selectedSport.color;
        });
      },
      items: colorList.map<DropdownMenuItem<Item>>((Item item) {
        return DropdownMenuItem<Item>(
          value: item,
          child: SizedBox(
            width: 100,
            child: Text(item.name),
          ),
        );
      }).toList(),
    );
  }
  String getString(){
    return curSport;
  }
}