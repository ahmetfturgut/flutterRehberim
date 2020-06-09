import 'package:flutter/cupertino.dart';
import 'package:flutter_rehberim/models/kategori.dart';
import 'package:flutter_rehberim/models/notlar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DatabaseHelper {
  static DatabaseHelper _databaseHalper;
  static Database _database;

  factory DatabaseHelper() {
    if (_databaseHalper == null) {
      _databaseHalper = DatabaseHelper.internal();
      return _databaseHalper;
    } else {
      return _databaseHalper;
    }
  }

  DatabaseHelper.internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var lock = Lock();
    Database _db;

    if (_db == null) {
      await lock.synchronized(() async {
        if (_db == null) {
          var databasesPath = await getDatabasesPath();
          var path = join(databasesPath, "appDb.db");
          print("oluşacak db'nin path'i $path");
          var file = new File(path);

          // check if file exists
          if (!await file.exists()) {
            ByteData data =
            await rootBundle.load(join("assets/db", "notlar.db"));
            List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
            await new File(path).writeAsBytes(bytes);
          }
          // open the database
          _db = await openDatabase(path);
        }
      });
    }

    return _db;
  }

  Future<List<Map<String, dynamic>>> kategorileriGetir() async {
    var db = await _getDatabase();
    var sonuc = await db.query("kategori");

    return sonuc;
  }

  Future<int> kategoriEkle(Kategori kategori) async {

    var db = await _getDatabase();
    var sonuc = await db.insert("kategori", kategori.toMap());
    debugPrint(sonuc.toString());
    return sonuc;
  }

  Future<int> kategoriGuncelle(Kategori kategori) async {
    var db = await _getDatabase();
    var sonuc = await db.update("kategori", kategori.toMap(),
        where: "kategoriID=?", whereArgs: [kategori.kategoriID]);
    return sonuc;
  }

  Future<int> kategoriSil(int kategoriID) async {
    var db = await _getDatabase();
    var sonuc = await db
        .delete("kategori", where: "kategoriID=?", whereArgs: [kategoriID]);
    return sonuc;
  }





  Future<List<Map<String, dynamic>>> notlariGetir() async {
    var db = await _getDatabase();
    var sonuc = await db.query("notlar",orderBy: "notId DESC");
    return sonuc;
  }
  Future<int> notEkle(Notlar notlar) async {
    var db = await _getDatabase();
    var sonuc = await db.insert("notlar", notlar.toMap());
    return sonuc;
  }


  Future<int> notlariGuncelle(Notlar notlar) async {
    var db = await _getDatabase();
    var sonuc = await db.update("notlar", notlar.toMap(),
        where: "notId=?", whereArgs: [notlar.notId]);
    return sonuc;
  }
  Future<int> notSil(int notId) async {
    var db = await _getDatabase();
    var sonuc = await db
        .delete("notlar", where: "notId=?", whereArgs: [notId]);
    return sonuc;
  }

}
