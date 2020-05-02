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
                title: Text("Title Widget"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  FlatButton(
                    child: Text("No"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
                content: Text("Content"),
              ),
            );
          },
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}