
import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Widgets extends StatefulWidget {
  @override
  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Widgets"),
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
                            builder: (context) => WidgetPage(widgetKey: "Icon")));
                  },
                  child:Card(
                      child: Center(child: Text("Icon")),
                      elevation: 5,
                    ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(widgetKey: "Text")));
                  },
                  child: Card(
                      child: Center(child: Text("Text")),
                      elevation: 5,
                    ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Switch")));
                    },
                    child: Card(
                      child: Center(child: Text("Switch")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Checkbox")));
                    },
                    child: Card(
                      child: Center(child: Text("Checkbox")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Alert Dialog")));
                    },
                    child: Card(
                      child: Center(child: Text("Alert Dialog")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Indicator")));
                    },
                    child: Card(
                      child: Center(child: Text("Indicator")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Slider")));
                    },
                    child: Card(
                      child: Center(child: Text("Slider")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Radio")));
                    },
                    child: Card(
                      child: Center(child: Text("Radio")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "TextField")));
                    },
                    child: Card(
                      child: Center(child: Text("TextField")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "TextFormField")));
                    },
                    child: Card(
                      child: Center(child: Text("TextFormField")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Image")));
                    },
                    child: Card(
                      child: Center(child: Text("Image")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Card,Inkwell")));
                    },
                    child: Card(
                      child: Center(child: Text("Card,Inkwell")),
                      elevation: 5,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WidgetPage(widgetKey: "Buttons")));
                    },
                    child: Card(
                      child: Center(child: Text("Buttons")),
                      elevation: 5,
                    )),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "DropdownButton,MenuButton")));
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Card(
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("DropdownButton"),
                          Text("MenuButton")
                        ],
                      )),
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
