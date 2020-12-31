import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class ChartsPage extends StatefulWidget {
  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Charts"),
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
                          builder: (context) =>
                              WidgetPage(widgetKey: "TimeSeriesChart")));
                },
                child: Card(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Time Series Chart"),
                  )),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "PieChart")));
                },
                child: Card(
                  child: Center(child: Text("Pie Chart")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "LineChart")));
                },
                child: Card(
                  child: Center(child: Text("Line Chart")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "BarChart")));
                },
                child: Card(
                  child: Center(child: Text("Bar Chart")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "GraphView")));
                },
                child: Card(
                  child: Center(child: Text("GraphView")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "HeatmapCalender")));
                },
                child: Card(
                  child: Center(child: Text("Heatmap Calender")),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "RadarChart")));
                },
                child: Card(
                  child: Center(child: Text("Radar Chart")),
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
