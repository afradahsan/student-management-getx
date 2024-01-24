import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  static const dbVersion = 3;
  static const tableName = 'student';

  Future<Database> get db async{
    if(_db!=null){
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
  Directory documentDir = await getApplicationDocumentsDirectory();
  String path = join(documentDir.path, tableName);
  print('Database path: $path');
  var db = await openDatabase(path, version: dbVersion, onCreate: onCreate, onUpgrade: onUpgrade);
  print('Database opened: $db');
  return db;
}

  onCreate(Database db, int version) {
  print('Creating database...');
  db.execute(
    '''CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY,
      name TEXT,
      className TEXT,
      stream TEXT
    )'''
  );
  print('Table created: $tableName');
}

  onUpgrade(Database db, int oldVersion, int newVersion) {
  if (oldVersion < 2) {
    db.execute('ALTER TABLE $tableName ADD COLUMN className TEXT');
    db.execute('ALTER TABLE $tableName ADD COLUMN stream TEXT');
  }
}

}