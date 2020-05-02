import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({Key key}) : super(key: key);

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int _radioVal = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        children: <Widget>[
          Text('Radio',style: TextStyle(fontSize: 25),),
          SizedBox(width: 40,),
          Row(
            children: [0, 1, 2, 3]
                .map((int index) => Radio<int>(
                      value: index,
                      groupValue: this._radioVal,
                      onChanged: (int value) {
                        setState(() => this._radioVal = value);
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
