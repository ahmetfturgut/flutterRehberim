import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2.0,
      child: Icon(Icons.contacts, color: Colors.white),
      onPressed: () {
        showDialog(
            context: context,
            child: new AlertDialog(
              title: Center(child: new Text("Mesaj")),
              content: SingleChildScrollView(
                child: Form(
                    child: Container(
                  width: 200, 
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Ad Soyad",
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "E Mail",
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Mesal",
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text("Gönder"),
                        ),
                      )
                    ],
                  ),
                )),
              ),
            ));
      },
    );
  }
}
