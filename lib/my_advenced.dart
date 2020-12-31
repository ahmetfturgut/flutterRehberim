import 'package:flutter/material.dart';
import 'package:flutter_rehberim/advenced/persistence.dart';
import 'package:flutter_rehberim/animation/animation.dart';
import 'package:flutter_rehberim/charts/charts.dart';
import 'package:flutter_rehberim/plugins/plugins.dart';
import 'package:flutter_rehberim/state_management/state_management.dart';

class MyAdvenced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Persistence()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.sd_storage),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Persistence",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnimationPage()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.movie),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Animation",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StateManegementPage()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.developer_mode),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "State Management",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChartsPage()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.line_style),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Charts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Plugins()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.power),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Plugins",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
