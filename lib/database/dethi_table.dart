import 'package:sqflite/sqflite.dart';

import '../models/de_thi.dart';
import 'dethi_database.dart';

class DeThiTable {
  static const tableName = 'deThis';
  static const createTableQuery = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      idDeThi INTEGER,
      uId INTEGER,
      time TEXT,
      cauHienTai INTEGER
    );
  ''';
  static const dropTableQuery = '''
    DROP TABLE IF EXISTS $tableName
  ''';

  Future<int> insertDeThi(DeThi deThi) async {
    final Database db = await DeThiDatabase.instance.database;
    return db.insert(
      tableName,
      deThi.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Future<void> deleteMessage(Message message) async {
  //   final Database db = await ChatDatabase.instance.database;
  //   await db.delete(
  //     tableName,
  //     where: 'id = ?',
  //     // whereArgs: [message.id],
  //   );
  // }

  Future<List<DeThi>> selectAllDeThi() async {
    final Database db = await DeThiDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      orderBy: 'id ASC',
    );
    return List.generate(maps.length, (index) {
      return DeThi.fromMap(maps[index]);
    });
  }
}
