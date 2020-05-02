import 'package:flutter/material.dart';

class LSizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          color: Colors.teal,
          onPressed: () {},
          child: Text("Simple RaisedButton"),
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(

          color: Colors.teal.shade200,
          onPressed: () {},
          child: Text("Simple RaisedButton"),
        ),
        SizedBox(
          height: 100,

          child: RaisedButton(

            color: Colors.teal.shade300,
            onPressed: () {},
            child: Text("Button with specific height"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 100,
          child: RaisedButton(

            color: Colors.teal.shade400,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Button with specific width"),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(

              color: Colors.teal.shade100,
              onPressed: () {}, child: Text("Button with infinity width")),
        )
      ],
    );
  }
}