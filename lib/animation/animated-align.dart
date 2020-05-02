import 'package:flutter/material.dart';

class IAnimatedAlign extends StatefulWidget {
  @override
  _IAnimatedAlignState createState() => _IAnimatedAlignState();
}

class _IAnimatedAlignState extends State<IAnimatedAlign> {
  Alignment _alignment = Alignment.topLeft;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedAlign(
        alignment: _alignment,
        duration: Duration(seconds: 1),
        child: Container(
          width:100.0,
          height: 100.0,
          color: Colors.teal,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {
            _alignment = _alignment == Alignment.topLeft
                ? Alignment.bottomRight
                : Alignment.topLeft;
          });
        },
        label: Text("Change alignment"),
      ),
    );
  }
}