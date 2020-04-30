import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const List<String> DEFAULT_FAVORITES = [
    'Football',
    'Basketball',
    'Baseball',
    'Soccer',
    'Volleyball'
  ];

  Future<List<String>> get_favorites() async {
    final prefs = await _prefs;
    return prefs.getStringList('favorites') ?? DEFAULT_FAVORITES;
  }

  Future<bool> set_favorites(final List<String> favorites) async {
    final prefs = await _prefs;
    return await prefs.setStringList('favorites', favorites);
  }
}

class FavoritesManager extends StatefulWidget {
  FavoritesManager({Key key}) : super(key: key);

  @override
  _FavoritesManagerState createState() => _FavoritesManagerState();
}

class _FavoritesManagerState extends State<FavoritesManager> {
  Favorites _mgr = Favorites();
  Future<List<String>> _order;

  @override
  void initState() {
    _order = _mgr.get_favorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Manage Favorites'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<String>>(
        future: _order,
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            var order = snap.data.toList();
            return ReorderableListView(
              onReorder: (int oldIdx, int newIdx) {
                if (newIdx > oldIdx) newIdx--;
                order.insert(newIdx, order.removeAt(oldIdx));

                setState(() {
                  _mgr.set_favorites(order);
                  _order = Future.value(order);
                });
              },
              children: order.map((sport) {
                return ListTile(
                  key: Key(sport),
                  title: Text(sport),
                  trailing: Icon(Icons.drag_handle),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
