import 'package:flutter/material.dart';

class ExpansionTilE extends StatelessWidget {
  const ExpansionTilE({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
      itemCount: data.length,
    );
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

const List<Entry> data = <Entry>[
  Entry(
    'Bölüm A',
    <Entry>[
      Entry(
        'Seçenek A0',
        <Entry>[
          Entry('Eleman A0.1'),
          Entry('Eleman A0.2'),
        ],
      ),
      Entry('Seçenek A1'),
      Entry('Seçenek A2'),
    ],
  ),
  Entry(
    'Bölüm B',
    <Entry>[
      Entry('Seçenek B0'),
      Entry('Seçenek B1'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}