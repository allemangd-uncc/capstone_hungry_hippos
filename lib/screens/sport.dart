import 'package:flutter/material.dart';

class Sport extends StatelessWidget {
  final List<Object> _curSport = ['FootBall', Colors.green];

  final List<Item> colorList = <Item>[
    const Item("FootBall", Colors.red),
    const Item("Soccer", Colors.pinkAccent),
    const Item('Baseball', Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    Item selectedSport;

    return StatefulBuilder(
      builder: (context, StateSetter setState) => Scaffold(
        appBar: AppBar(
          title: DropdownButton<Item>(
            value: selectedSport,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            style: TextStyle(color: Colors.black),
            iconEnabledColor: Colors.white,
            onChanged: (Item value) {
              setState(() {
                selectedSport = value;
                _curSport[0] = selectedSport.name;
                _curSport[1] = selectedSport.color;
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
          ),
          backgroundColor: _curSport[1],
        ),
        body: Center(
          child: Text("Sports Page Body"),
        ),
      ),
    );
  }
}

class Item {
  const Item(this.name, this.color);

  final String name;
  final Color color;
}
