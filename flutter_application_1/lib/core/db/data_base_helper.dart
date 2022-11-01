import 'dart:io';

import 'package:flutter_application_1/common/data_base_request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  void init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'test.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      // todo
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onCreate: (db, version) {},
      );
    }
  }

  void onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
  }

  void onDropDataBase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      // todo
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
