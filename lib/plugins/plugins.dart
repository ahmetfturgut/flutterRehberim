import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Plugins extends StatefulWidget {
  @override
  _PluginsState createState() => _PluginsState();
}

class _PluginsState extends State<Plugins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Plugins"),
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
                          builder: (context) => WidgetPage(widgetKey: "Image Picker")));
                },
                child: Card(
                  child: Center(child: Text("Image Picker")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Web View")));
                },
                child: Card(
                  child: Center(child: Text("Web View")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Markdown rendering")));
                },
                child: Card(
                  child: Center(child: Text("Markdown rendering")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Local auth")));
                },
                child: Card(
                  child: Center(child: Text("Local auth")),
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
