import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  const GridList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      // Generate 100 Widgets that display their index in the List
      children: List.generate(100, (index) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade200,
              border: Border.all(color: Colors.grey, width: 3.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        );
      }),
    );
  }
}