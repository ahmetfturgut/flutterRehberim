import 'package:flutter/material.dart';

class IAnimatedList extends StatefulWidget {
  @override
  _IAnimatedListState createState() => _IAnimatedListState();
}

class _IAnimatedListState extends State<IAnimatedList> {
  int count = 5;
  GlobalKey<AnimatedListState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
          key: key,
          initialItemCount: count,
          itemBuilder: (context, index, animation) => AlignTransition(
              alignment: animation.drive(
                AlignmentTween(
                    begin: Alignment.topRight, end: Alignment.topLeft),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello #$index"),
              ))),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {
            key.currentState.insertItem(count, duration: Duration(seconds: 1));
            count++;
          });
        },
        label: Text("Add Item"),
      ),
    );
  }
}