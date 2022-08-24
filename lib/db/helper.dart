import 'dart:io';

import 'package:calculadora/model/operation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory databaseDiretory = await getApplicationDocumentsDirectory();
    String path = p.join(databaseDiretory.path, 'history.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE operations(
        id INTEGER PRIMARY KEY,
        operation TEXT,
        result TEXT
      )
    ''');
  }

  Future<List<Operation>> getHistory() async {
    Database db = await instance.database;
    var operations = await db.query('operations', orderBy: 'id DESC');
    List<Operation> operationsList = operations.isNotEmpty
        ? operations.map((json) => Operation.fromMap(json)).toList()
        : [];
    return operationsList;
  }
}
