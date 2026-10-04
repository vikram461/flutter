import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperBundle {
  static final DatabaseHelperBundle instance = DatabaseHelperBundle._internal();

  static Database? _database;

  DatabaseHelperBundle._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();

    final path = join(
      databasesPath,
      'auto_revision.db',
    );

    // Copy database from assets if it doesn't exist
    if (!await File(path).exists()) {
      final data = await rootBundle.load(
        'assets/database/auto_revision.db.db',
      );

      final bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(
        bytes,
        flush: true,
      );
    }

    return await openDatabase(path);
  }
}