import 'package:flutter/material.dart';

class IAnimatedPositioned extends StatefulWidget {
  @override
  _IAnimatedPositionedState createState() => _IAnimatedPositionedState();
}

class _IAnimatedPositionedState extends State<IAnimatedPositioned> {
  double _top = 100.0;
  bool change = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            top: _top,
            duration: Duration(seconds: 1),
            child: Image.asset("assets/images/30.jpg", fit: BoxFit.fill),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {
            change = !change;
            _top = change ? 100 : 0.0;
          });
        },
        label: Text("Change Position"),
      ),
    );
  }
}