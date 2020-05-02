import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class StateManegementPage extends StatefulWidget {
  @override
  _StateManegementPageState createState() => _StateManegementPageState();
}

class _StateManegementPageState extends State<StateManegementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("State Manegement"),
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
                          builder: (context) => WidgetPage(widgetKey: "SteamBuilder")));
                },
                child: Card(
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("SteamBuilder(timer app)"),
                  )),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "SteamController")));
                },
                child: Card(
                  child: Center(child: Text("SteamController")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Inherited Widget")));
                },
                child: Card(
                  child: Center(child: Text("Inherited Widget")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Scoped Model")));
                },
                child: Card(
                  child: Center(child: Text("Scoped Model")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "BLoC Pettern")));
                },
                child: Card(
                  child: Center(child: Text("BLoC Pettern")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Easier BLoC Pettern")));
                },
                child: Card(
                  child: Center(child: Text("Easier BLoC Pettern")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Provider")));
                },
                child: Card(
                  child: Center(child: Text("Provider")),
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
