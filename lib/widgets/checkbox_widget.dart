import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _checkBoxVal = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child:  Checkbox(
                onChanged: (bool value) {
                  setState(() => this._checkBoxVal = value);
                },
                value: this._checkBoxVal,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Checkbox : $_checkBoxVal",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              tristate: true,
              onChanged: null,
              value: null,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Checkbox : false",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),

      ],
    );
  }
}
