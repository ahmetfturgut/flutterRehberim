import 'package:flutter/material.dart';

class LRow extends StatefulWidget {
  @override
  _LRowState createState() => _LRowState();
}

enum SingingCharacter { spaceEvenly, start, center }

class _LRowState extends State<LRow> {
  SingingCharacter _character = SingingCharacter.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: _mainAxisAlignment,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: Colors.green[50],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "İtem1",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.yellow[50],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "İtem2",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red[50],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "İtem3",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
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
                  value: SingingCharacter.spaceEvenly,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                    });
                  },
                ),
                Text("Evently"),
                Radio(
                  value: SingingCharacter.start,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.start;
                    });
                  },
                ),
                Text("Start"),
                Radio(
                  value: SingingCharacter.center,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
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
