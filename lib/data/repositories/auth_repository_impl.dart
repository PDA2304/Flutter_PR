import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/core/db/data_base_helper.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:pr2/domain/repositories/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoryImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.dataBase;

  @override
  String get table => DataBaseRequest.tableUsers;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password) {
    try {
      _db.insert(table, Users());
    } on DatabaseException catch (error) {}
  }
}
