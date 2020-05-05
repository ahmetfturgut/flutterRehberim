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
                title: Text("Başlık"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Evet"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  FlatButton(
                    child: Text("Hayır"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
                content: Text("İçerik"),
              ),
            );
          },
          child: Text("Dialog'u Göster"),
        ),
      ),
    );
  }
}