import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Appbar"),
      ),
      body: Container(
          decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/35.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
        child: Padding(
          padding: const EdgeInsets.only(top:18.0,left: 10,right: 10),
          child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Sade Appbar")));
                },

                child: Card(

                  child: Center(child: Text("Sade Appbar")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Bottom Appbar")));
                },

                child: Card(

                  child: Center(child: Text("Bottom Appbar")),
                  elevation: 5,
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Search")));
                },

                child: Card(

                  child: Center(child: Text("Search")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Backdrop")));
                },

                child: Card(

                  child: Center(child: Text("Backdrop")),
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
