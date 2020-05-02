import 'package:flutter/material.dart';
class IndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('LinearProgressIndicator'),
          LinearProgressIndicator(),

          SizedBox(height: 40,),
          Text('CircularProgressIndicator'),
          Center(child: CircularProgressIndicator()),

        ],
      ),
    );
  }
}
