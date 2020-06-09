import 'dart:io';

import 'package:async/async.dart';
import 'package:english_words/english_words.dart' as english_words;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Kategori {
  final int id;
  final String content;
  final bool isDone;
  final DateTime createdAt;

  Kategori({this.id, this.content, this.isDone = false, this.createdAt});

  Kategori.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'],
        content = map['content'],
        isDone = map['isDone'] == 1,
        createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']);

  Map<String, dynamic> toJsonMap() => {
    'id': id,
    'content': content,
    'isDone': isDone ? 1 : 0,
    'createdAt': createdAt.millisecondsSinceEpoch,
  };
}

class Sqlite extends StatefulWidget {
  const Sqlite({Key key}) : super(key: key);

  @override
  _SqliteState createState() => _SqliteState();
}

class _SqliteState extends State<Sqlite> {
  static const dosyaAdi = 'sqflite_ex.db';
  static const tabloAdi = 'example_tbl';
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  Database _db;
  List<Kategori> _todos = [];

  // Opens a db local file. Creates the db table if it's not yet created.
  Future<void> _initDb() async {
    final dbFolder = await getDatabasesPath();
    if (!await Directory(dbFolder).exists()) {
      await Directory(dbFolder).create(recursive: true);
    }
    final dbPath = join(dbFolder, dosyaAdi);
    this._db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $tabloAdi(
          id INTEGER PRIMARY KEY, 
          isDone BIT NOT NULL,
          content TEXT,
          createdAt INT)
        ''');
      },
    );
  }

  Future<void> _kategorileriGetir() async {
    List<Map> jsons = await this._db.rawQuery('SELECT * FROM $tabloAdi');
    print('dbden ${jsons.length} kayıt geldi');
    this._todos = jsons.map((json) => Kategori.fromJsonMap(json)).toList();
  }

  Future<void> _kategoriEkle(Kategori kategori) async {
    await this._db.transaction(
          (Transaction txn) async {
         await txn.rawInsert('''
          INSERT INTO $tabloAdi
            (content, isDone, createdAt)
          VALUES
            (
              "${kategori.content}",
              ${kategori.isDone ? 1 : 0}, 
              ${kategori.createdAt.millisecondsSinceEpoch}
            )''');

      },
    );
  }

  Future<void> _kategoriGuncelle(Kategori kategori) async {
    await this._db.rawUpdate(
      /*sql=*/
      '''UPDATE $tabloAdi
                    SET isDone = ?
                    WHERE id = ?''',
      /*args=*/ [kategori.isDone ? 0 : 1, kategori.id],
    );

  }

  Future<void> _kategoriSil(Kategori kategori) async {
     await this._db.rawDelete('''
        DELETE FROM $tabloAdi
        WHERE id = ${kategori.id}
      ''');

  }

  Future<bool> _asyncInit() async {
    await _memoizer.runOnce(() async {
      await _initDb();
      await _kategorileriGetir();
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _asyncInit(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == false)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Scaffold(
          body: ListView(
            children: this._todos.map(_itemToListTile).toList(),
          ),
          floatingActionButton: _buildFloatingActionButton(),
        );
      },
    );
  }

  Future<void> _updateUI() async {
    await _kategorileriGetir();
    setState(() {});
  }

  ListTile _itemToListTile(Kategori kategori) => ListTile(
    title: Text(
      "Eklenen ${kategori.id.toString()}. eleman",
      style: TextStyle(
          fontStyle: kategori.isDone ? FontStyle.italic : null,
          color: kategori.isDone ? Colors.grey : null,
          decoration: kategori.isDone ? TextDecoration.lineThrough : null),
    ),
    subtitle: Text('id=${kategori.id}\ncreated at ${kategori.createdAt}'),
    isThreeLine: true,
    leading:  RaisedButton(
      color:  kategori.isDone ?Colors.grey:Colors.green,
      textColor: Colors.white,
      onPressed: () async {
        await _kategoriGuncelle(kategori);
        _updateUI();
      },
      child: kategori.isDone ? Text("Pasif") : Text("Aktif"),
    ),

    trailing:   RaisedButton(
      onPressed: () async {
        await _kategoriSil(kategori);
        _updateUI();
      },
      child: Text("Sil"),
      textColor: Colors.white,
      color: Colors.red,
    ),
  );

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await _kategoriEkle(
          Kategori(
            content: english_words.generateWordPairs().first.asPascalCase,
            createdAt: DateTime.now(),
          ),
        );
        _updateUI();
      },
    );
  }
}
