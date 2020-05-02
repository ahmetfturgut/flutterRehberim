import 'package:flutter/material.dart';

class LWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 16.0, // gap between adjacent chips
                runSpacing: 8.0, // gap between lines
                children: <Widget>[
                  CircleAvatar(child: Text('A')),
                  CircleAvatar(child: Text('B')),
                  CircleAvatar(child: Text('C')),
                  CircleAvatar(child: Text('D')),
                  CircleAvatar(child: Text('E')),
                  CircleAvatar(child: Text('F')),
                  CircleAvatar(child: Text('G')),
                  CircleAvatar(child: Text('H')),
                  CircleAvatar(child: Text('I')),
                  CircleAvatar(child: Text('J')),
                  CircleAvatar(child: Text('K')),
                  CircleAvatar(child: Text('L')),
                  CircleAvatar(child: Text('M')),
                  CircleAvatar(child: Text('N')),
                  CircleAvatar(child: Text('O')),
                  CircleAvatar(child: Text('P')),
                  CircleAvatar(child: Text('Q')),
                  CircleAvatar(child: Text('R')),
                  CircleAvatar(child: Text('S')),
                  CircleAvatar(child: Text('T')),
                  CircleAvatar(child: Text('U')),
                  CircleAvatar(child: Text('V')),
                  CircleAvatar(child: Text('W')),
                  CircleAvatar(child: Text('X')),
                  CircleAvatar(child: Text('Y')),
                  CircleAvatar(child: Text('Z')),
                ],
              ),
            ),
          ),
          SizedBox(height: 80,),
          Expanded(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 16.0, // gap between adjacent chips
              runSpacing: 8.0, // gap between lines
              children: <Widget>[
                CircleAvatar(child: Text('0')),
                CircleAvatar(child: Text('1')),
                CircleAvatar(child: Text('2')),
                CircleAvatar(child: Text('3')),
                CircleAvatar(child: Text('4')),
                CircleAvatar(child: Text('5')),
                CircleAvatar(child: Text('6')),
                CircleAvatar(child: Text('7')),
                CircleAvatar(child: Text('8')),
                CircleAvatar(child: Text('9')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
