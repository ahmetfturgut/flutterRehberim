import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Layauts extends StatefulWidget {
  @override
  _LayautsState createState() => _LayautsState();
}

class _LayautsState extends State<Layauts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Layouts"),
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
                            builder: (context) => WidgetPage(widgetKey: "Container")));
                  },

                    child: Card(

                      child: Center(child: Text("Container")),
                      elevation: 5,
                    ),
                   ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Row")));
                },

                child: Card(

                  child: Center(child: Text("Row")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Column")));
                },

                child: Card(

                  child: Center(child: Text("Column")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Wrap")));
                },

                child: Card(

                  child: Center(child: Text("Wrap")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Expanded")));
                },

                child: Card(

                  child: Center(child: Text("Expanded")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "SizedBox")));
                },

                child: Card(

                  child: Center(child: Text("SizedBox")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(widgetKey: "Stack")));
                },

                child: Card(

                  child: Center(child: Text("Stack")),
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
