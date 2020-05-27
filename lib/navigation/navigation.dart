import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Navigation"),
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
                          builder: (context) => WidgetPage(widgetKey: "Tabs")));
                },
                child: Card(
                  child: Center(child: Text("Tabs")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "Dialogs")));
                },
                child: Card(
                  child: Center(child: Text("Dialogs")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "Routes")));
                },
                child: Card(
                  child: Center(child: Text("Routes")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "Navigation Drawer")));
                },
                child: Card(
                  child: Center(child: Text("Navigation Drawer")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "BottomSheet")));
                },
                child: Card(
                  child: Center(child: Text("BottomSheet")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "BottomTabbar")));
                },
                child: Card(
                  child: Center(child: Text("BottomTabbar")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "Page Selector")));
                },
                child: Card(
                  child: Center(child: Text("Page Selector")),
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
