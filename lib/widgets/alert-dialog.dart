import 'package:flutter/material.dart';

class IAlertDialog extends StatefulWidget {
  @override
  _IAlertDialogState createState() => _IAlertDialogState();
}

class _IAlertDialogState extends State<IAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlineButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  "Title",
                  style: TextStyle(color: Colors.black),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Yes", style: TextStyle(color: Colors.black)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  FlatButton(
                    child: Text("No", style: TextStyle(color: Colors.black)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
                content: Text("Body"),
              ),
            );
          },
          child: Text("Show Dialog", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
