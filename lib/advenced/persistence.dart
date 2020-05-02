import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Persistence extends StatefulWidget {
  @override
  _PersistenceState createState() => _PersistenceState();
}

class _PersistenceState extends State<Persistence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Persistence"),
      ),
      body: Container(
          decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/35.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
          child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "SQLite")));
                },
                child: Card(
                  child: Center(child: Text("SQLite")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Shared preference")));
                },
                child: Card(
                  child: Center(child: Text("Shared preference")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Local file R/W")));
                },
                child: Card(
                  child: Center(child: Text("Local file R/W")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Sembast")));
                },
                child: Card(
                  child: Center(child: Text("Sembast")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Hive")));
                },
                child: Card(
                  child: Center(child: Text("Hive")),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
