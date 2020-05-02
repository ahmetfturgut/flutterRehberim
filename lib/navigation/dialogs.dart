import 'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  const Dialogs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32.0),
      children: <Widget>[
        ////// Alert dialog.
        RaisedButton(
            color: Colors.tealAccent,
            child: Text('Alert Dialog'),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Dialog title'),
                  content: Text(
                    'Örnek alert',
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                    ),
                    FlatButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.pop(context, 'OK'),
                    ),
                  ],
                ),
              ).then((returnVal) {
                if (returnVal != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You clicked: $returnVal'),
                      action: SnackBarAction(label: 'OK', onPressed: () {}),
                    ),
                  );
                }
              });
            }),
        ////// Simple Dialog.
        RaisedButton(
          color: Colors.cyan.shade200,
          child: Text('Simple dialog'),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                title: Text('Dialog Title'),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('kullanıcı@example.com'),
                    onTap: () => Navigator.pop(context, 'kullanıcı@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('kullanıcı2@gmail.com'),
                    onTap: () => Navigator.pop(context, 'kullanıcı2@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_circle),
                    title: Text('Yeni Kullanıcı'),
                    onTap: () => Navigator.pop(context, 'Yeni Kullanıcı'),
                  ),
                ],
              ),
            ).then((returnVal) {
              if (returnVal != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tıkladığın: $returnVal'),
                    action: SnackBarAction(label: 'Tamam', onPressed: () {}),
                  ),
                );
              }
            });
          },
        ),
        ////// Time Picker Dialog.
        RaisedButton(
          color: Colors.cyan.shade400,
          child: Text('Time Picker Dialog'),
          onPressed: () {
            DateTime now = DateTime.now();
            showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
            ).then((TimeOfDay value) {
              if (value != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${value.format(context)}'),
                    action: SnackBarAction(label: 'OK', onPressed: () {}),
                  ),
                );
              }
            });
          },
        ),
        ////// Date Picker Dialog.
        RaisedButton(
          color: Colors.blue.shade900,
          child: Text('Date Picker Dialog',style: TextStyle(color: Colors.white),),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2018),
              lastDate: DateTime(2025),
            ).then((DateTime value) {
              if (value != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Selected datetime: $value')),
                );
              }
            });
          },
        ),
        ////// Bottom Sheet Dialog.
        RaisedButton(
          color: Colors.teal.shade600,
          child: Text('Bottom Sheet'),
          onPressed: () {
            // Or: showModalBottomSheet(), with model bottom sheet, clicking
            // anywhere will dismiss the bottom sheet.
            showBottomSheet<String>(
              context: context,
              builder: (BuildContext context) => Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      title: Text('Bu bir alt sayfa'),
                    ),
                    ListTile(
                      dense: true,
                      title: Text("Kapatmak için 'Tamam'a tılayın"),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Tamam'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ]
          .map(
            (Widget button) => Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: button,
        ),
      )
          .toList(),
    );
  }
}