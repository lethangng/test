import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dethi_table.dart';

class DeThiDatabase {
  static const dbName = 'dethi.db';
  static const dbVersion = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      debugPrint('Database path: ${await getDatabasesPath()}');
      return _database!;
    }
    _database = await init();
    debugPrint('Database null path: ${await getDatabasesPath()}');
    return _database!;
  }

  DeThiDatabase._internal();
  static final DeThiDatabase instance = DeThiDatabase._internal();

  static const initScripts = [
    DeThiTable.createTableQuery,
  ];
  static const migrationScripts = [
    DeThiTable.dropTableQuery,
  ];

  Future<Database> init() async {
    final path = join(
      await getDatabasesPath(),
      dbName,
    );

    var database = await openDatabase(
      path,
      onCreate: (db, version) {
        initScripts.forEach((scrip) async => await db.execute(scrip));
      },
      onUpgrade: (db, oldVersion, newVersion) {
        migrationScripts.forEach((scrip) async => await db.execute(scrip));
      },
      version: dbVersion,
      singleInstance: true,
    );
    return database;
  }
}
