import 'dart:io';

import 'package:pr1/common/data_base_request.dart';
import 'package:pr1/data/model/role.dart';
import 'package:pr1/data/model/user.dart';
import 'package:pr1/domain/entity/role_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  /// Иницилизация базы данных
  void init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'test.db');

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    } else if (Platform.isAndroid || Platform.isIOS) {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) async =>
            await onUpgradeTable(db),
        onCreate: (db, version) async => await onCreateTable(db),
      );
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var table in DataBaseRequest.createTableList) {
      await db.execute(table);
    }
    await onInitTable(db);
  }

  Future<void> onUpgradeTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    await onCreateTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(
          DataBaseRequest.tableRole,
          Role(name: element.name).toMap(),
        );
      }

      db.insert(DataBaseRequest.tableUsers,
          User(login: 'admin', password: 'admin', idRole: RoleEnum.admin).toMap());
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onDropDataBase() async {
    database.close();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    } else if (Platform.isAndroid || Platform.isIOS) {
      await deleteDatabase(_pathDB);
    }
  }
}
