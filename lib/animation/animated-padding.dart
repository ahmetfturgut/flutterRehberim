import 'package:flutter/material.dart';

class IAnimatedPadding extends StatefulWidget {
  @override
  _IAnimatedPaddingState createState() => _IAnimatedPaddingState();
}

class _IAnimatedPaddingState extends State<IAnimatedPadding> {
  EdgeInsetsGeometry _padding = EdgeInsets.all(0.0);
  bool change = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: AnimatedPadding(
        padding: _padding,
        duration: Duration(seconds: 1),
        child: Image.asset("assets/images/30.jpg", fit: BoxFit.contain),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {

            _padding = change ? EdgeInsets.all(46.0) : EdgeInsets.all(0.0);
            change = !change;
          });
        },
        label: Text("Change Padding"),
      ),
    );
  }
}