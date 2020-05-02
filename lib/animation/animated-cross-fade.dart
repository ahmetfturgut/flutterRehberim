import 'package:flutter/material.dart';

class IAnimatedCrossFade extends StatefulWidget {
  @override
  _IAnimatedCrossFadeState createState() => _IAnimatedCrossFadeState();
}

class _IAnimatedCrossFadeState extends State<IAnimatedCrossFade> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedCrossFade(
        key: UniqueKey(),
        duration: Duration(seconds: 1),
        crossFadeState: _crossFadeState,
        firstChild: Container(color: Colors.red),
        secondChild: Container(color: Colors.blue),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {
            _crossFadeState = _crossFadeState == CrossFadeState.showFirst
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst;
          });
        },
        label: Text("Change Cross Fade"),
      ),
    );
  }
}