import 'dart:io';
import 'package:flutter_application_1/Database/model.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseIn {
  //untuk pengecekan database
  final String table = 'contacts';
  Database? _data;

  Future<Database> get database async {
    if (_data != null) return _data!;
    _data = await _initDatabase();
    return _data!;
  }

  Future<Database> _initDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'contacts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            phone TEXT
          )
        ''');
      },
    );
  }

 //untuk memasukkan data
  Future<int> insert(ContactModel data) async {
    final db = await database;
    return await db.insert(table, data.toMap());
  }

//untuk mengambil data
  Future<List<ContactModel>> getAll() async {
    final db = await database;
    final result = await db.query(table);
    return result.map((e) => ContactModel.fromMap(e)).toList();
  }

//untuk memperbarui atau mengubah data
  Future<int> update(ContactModel data) async {
    final db = await database;

    return await db.update(
      table,
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }
  
//untuk menghapus data
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
