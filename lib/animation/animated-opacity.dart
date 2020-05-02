import 'package:flutter/material.dart';

class IAnimatedOpacity extends StatefulWidget {
  @override
  _IAnimatedOpacityState createState() => _IAnimatedOpacityState();
}

class _IAnimatedOpacityState extends State<IAnimatedOpacity> {
  double _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: _opacity,
        child: Container(color: Colors.red),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {
            _opacity = _opacity == 0.0 ? 1.0 : 0.0;
          });
        },
        label: Text("Change Opacity"),
      ),
    );
  }
}