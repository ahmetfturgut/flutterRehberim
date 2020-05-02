import 'package:flutter/material.dart';

class LColumn extends StatefulWidget {
  @override
  _LColumnState createState() => _LColumnState();
}

enum ALIGN { spaceEvenly, start, center }

class _LColumnState extends State<LColumn> {
  ALIGN _character = ALIGN.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Theme
                .of(context)
                .accentColor
                .withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Bu Column Widget - İtem1",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    "Bu Column Widget - İtem2",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Image.asset(
                    "assets/images/flutter-sdk.png",
                    fit: BoxFit.fitHeight,
                  ),
                  Text(
                    "Bu Column Widget - İtem4",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),

                  //new Container()
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              children: <Widget>[
                Radio(
                  value: ALIGN.spaceEvenly,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                    });
                  },
                ),
                Text("Evently"),
                Radio(
                  value: ALIGN.start,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.start;
                    });
                  },
                ),
                Text("Start"),
                Radio(
                  value: ALIGN.center,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.center;
                    });
                  },
                ),
                Text("Center"),
              ],
            ),
          ),
        )
      ],
    );
  }
}