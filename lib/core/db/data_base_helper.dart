import 'dart:io';

import 'package:path/path.dart';
import 'package:pr2/common/data_base_request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'booksstore.db');

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    } else {
      dataBase = await openDatabase(
        _pathDB,
        version: _version,
        onCreate: (db, version) {},
      );
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }

  }
}
