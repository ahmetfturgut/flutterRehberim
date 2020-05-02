import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _switchVal = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Switch(
                onChanged: (bool value) {
                  setState(() => this._switchVal = value);
                },
                value: this._switchVal,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Stitch : $_switchVal",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Switch(
                onChanged: null,
                value: false,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Switch : false",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),

      ],
    );
  }
}
