import 'package:flutter/material.dart';

class IAnimatedSwitcher extends StatefulWidget {
  @override
  _IAnimatedSwitcherState createState() => _IAnimatedSwitcherState();
}

class _IAnimatedSwitcherState extends State<IAnimatedSwitcher> {
  Widget child = Image.asset("assets/images/5.jpg", fit: BoxFit.cover);
  bool change = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: child,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {
            change = !change;
            child = change
                ? Image.asset("assets/images/30.jpg", fit: BoxFit.cover)
                : Center(
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.red,
              ),
            );
          });
        },
        label: Text("Switch Widget"),
      ),
    );
  }
}