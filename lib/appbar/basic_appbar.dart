import 'package:flutter/material.dart';

class BasicAppbar extends StatelessWidget {
  const BasicAppbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.tag_faces),
        title: Text("Başlık"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.directions_bike),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.directions_bus),
            onPressed: () {},
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text('Boat')),
                PopupMenuItem(child: Text('Train'))
              ];
            },
          )
        ],
      ),
      body: Center(child: Text("Merhaba Flutter")),
    );
  }
}