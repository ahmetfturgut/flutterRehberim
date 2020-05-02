
import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return Text(
        'Merhaba Flutter',
        // Optional params to try:
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blue,
            fontSize: 32.0,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline),
        // Or:
        // style: Theme.of(context).textTheme.xxx
      );

  }
}



