import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
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
                          builder: (context) => WidgetPage(widgetKey: "Animated Align")));
                },
                child: Card(
                  child: Center(child: Text("A. Align")),
                  elevation: 5,
                ),
              ),
             
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Animated Cross Fade")));
                },
                child: Card(
                  child: Center(child: Text("A. Cross Fade" ,style: TextStyle(fontSize: 13),)),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Animated Icons")));
                },
                child: Card(
                  child: Center(child: Text("A. Icons" ,style: TextStyle(fontSize: 13),)),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Animated List")));
                },
                child: Card(
                  child: Center(child: Text("A. List" ,style: TextStyle(fontSize: 13),)),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Animated Opacity")));
                },
                child: Card(
                  child: Center(child: Text("A. Opacity" ,style: TextStyle(fontSize: 13),)),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Animated Padding")));
                },
                child: Card(
                  child: Center(child: Text("A. Padding" ,style: TextStyle(fontSize: 13),)),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Animated Psitioned")));
                },
                child: Card(
                  child: Center(child: Text("A. Psitioned" ,style: TextStyle(fontSize: 13),)),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Animated Switcher")));
                },
                child: Card(
                  child: Center(child: Text("A. Switcher" ,style: TextStyle(fontSize: 13),)),
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
