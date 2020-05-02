import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _slider1Val = 0.5;
  double _slider2Val = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Slider(
          onChanged: (double value) {
            setState(() => this._slider1Val = value);
          },
          value: this._slider1Val,
        ),
        SizedBox(height: 30,),
        Slider(
            value: _slider2Val,
            min: 0.0,
            max: 100.0,
            divisions: 5,
            label: '${_slider2Val.round()}',
            onChanged: (double value) {
              setState(() => _slider2Val = value);
            }),

      ],
    );
  }
}
