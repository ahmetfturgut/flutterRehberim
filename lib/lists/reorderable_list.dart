import 'package:flutter/material.dart';

class ReorderableList extends StatefulWidget {
  const ReorderableList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReorderableListState();
  }
}

class _ListItem {
  _ListItem(this.value, this.checked);
  final String value;
  bool checked;
}

class _ReorderableListState extends State<ReorderableList> {
  bool _reverseSort = false;
  static final _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ].map((item) => _ListItem(item, false)).toList();


  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final _ListItem item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }


  void _onSort() {
    setState(() {
      _reverseSort = !_reverseSort;
      _items.sort((_ListItem a, _ListItem b) => _reverseSort
          ? b.value.compareTo(a.value)
          : a.value.compareTo(b.value));
    });
  }

  @override
  Widget build(BuildContext context) {
    final _appbar = AppBar(
      title: Text('Reorderable list'),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.sort_by_alpha),
          tooltip: 'Sort',
          onPressed: _onSort,
        ),
      ],
    );
    final _listTiles = _items
        .map(
          (item) => CheckboxListTile(
        key: Key(item.value),
        value: item.checked ?? false,
        onChanged: (bool newValue) {
          setState(() => item.checked = newValue);
        },
        title: Text('This item represents ${item.value}.'),
        isThreeLine: true,
        subtitle: Text('Item ${item.value}, checked=${item.checked}'),
        secondary: Icon(Icons.drag_handle),
      ),
    )
        .toList();
    return Scaffold(
      appBar: _appbar,
      body: ReorderableListView(
        onReorder: _onReorder,
        children: _listTiles,
      ),
    );
  }
}