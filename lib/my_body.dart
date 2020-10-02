import 'package:flutter/material.dart';
import 'package:flutter_rehberim/appbar/appbar.dart';
import 'package:flutter_rehberim/layauts/layauts.dart';
import 'package:flutter_rehberim/lists/lists.dart';
import 'package:flutter_rehberim/navigation/navigation.dart';
import 'package:flutter_rehberim/widgets.dart';

class MyBasic extends StatelessWidget {
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Widgets()));
                    },
                    child: Card(
                      // shape: BeveledRectangleBorder(
                      //   borderRadius: BorderRadius.circular(80.0),
                      // ),
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.widgets),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Widgets",
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
                          MaterialPageRoute(builder: (context) => Layauts()));
                    },
                    child: Card(
                        elevation: 6,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.dashboard),
                              height: 100,
                              width: 100,
                            ),
                            Hero(
                              tag: "LayautsHero",
                              child: Text(
                                "Layouts",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Lists()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.format_list_numbered_rtl),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Lists",
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
                          MaterialPageRoute(builder: (context) => Appbar()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: RotatedBox(
                              child: Icon(Icons.video_label),
                              quarterTurns: 2,
                            ),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Appbar",
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
                          builder: (context) => Navigation()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.view_carousel),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Navigation",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
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
