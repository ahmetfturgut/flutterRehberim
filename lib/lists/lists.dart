import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Lists"),
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
                          builder: (context) => WidgetPage(widgetKey: "ListTile")));
                },

                child: Card(

                  child: Center(child: Text("ListTile")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "ListView.builder")));
                },

                child: Card(

                  child: Center(child: Text("ListView.builder")),
                  elevation: 5,
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "GridList")));
                },

                child: Card(

                  child: Center(child: Text("GridList")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "ExpansionTile")));
                },

                child: Card(

                  child: Center(child: Text("ExpansionTile")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Swipe To Dismiss")));
                },

                child: Card(

                  child: Center(child: Text("Swipe To Dismiss")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Reorderable List")));
                },

                child: Card(

                  child: Center(child: Text("Reorderable List")),
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
