import 'package:flutter/material.dart';

class ListSwipeToDismiss extends StatefulWidget {
  const ListSwipeToDismiss({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListSwipeToDismissState();
  }
}

class _ListSwipeToDismissState extends State<ListSwipeToDismiss> {
  final _items = List<String>.generate(20, (i) => "Değer ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final String item = _items[index];

        return Dismissible(
          key: Key(item),

          onDismissed: (DismissDirection dir) {
            setState(() => this._items.removeAt(index));
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(dir == DismissDirection.startToEnd
                    ? '$item removed.'
                    : '$item liked.'),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    setState(() => this._items.insert(index, item));
                  },
                ),
              ),
            );
          },

          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete),
            alignment: Alignment.centerLeft,
          ),

          secondaryBackground: Container(
            color: Colors.green,
            child: Icon(Icons.thumb_up),
            alignment: Alignment.centerRight,
          ),
          child: ListTile(
            title: Center(child: Text('${_items[index]}')),
          ),
        );
      },
    );
  }
}