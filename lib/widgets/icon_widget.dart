import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.check, size: 64.0, color: Colors.teal),
          Icon(Icons.account_circle, size: 64.0, color: Colors.teal),
          Icon(Icons.android, size: 64.0, color: Colors.teal),
          Icon(Icons.iso, size: 64.0, color: Colors.teal),
          Icon(Icons.home, size: 64.0, color: Colors.teal),
          Icon(Icons.camera_alt, size: 64.0, color: Colors.teal),
        ],
      )
    );
  }
}
