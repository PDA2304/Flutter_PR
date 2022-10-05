import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/data/model/role.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'booksstore.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    } else {
      database = await openDatabase(
        _pathDB,
        version: 1,
        onCreate: (db, version) async {
          await onCreateTable(db);
        },
      );
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      db.execute(DataBaseRequest.tableCreateList[i]);
    }
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: 'Пользователя').toMap());
    } on DatabaseException catch (e) {
      print(e.getResultCode());
    }
  }
}
