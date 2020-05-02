import 'package:flutter/material.dart';

class IAnimatedContainer extends StatefulWidget {
  @override
  _IAnimatedContainerState createState() => _IAnimatedContainerState();
}

class _IAnimatedContainerState extends State<IAnimatedContainer> {
  Color _color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: _color,
        duration: Duration(seconds: 1),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {
            _color = _color == Colors.red ? Colors.blue : Colors.red;
          });
        },
        label: Text("Change color"),
      ),
    );
  }
}