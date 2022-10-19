import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/core/db/data_base_helper.dart';
import 'package:pr2/data/model/user.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:pr2/domain/repositories/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.dataBase;

  @override
  String get table => DataBaseRequest.tableUsers;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password) async {
    try {
      await _db.insert(
        table,
        User(
          login: login,
          password: password,
          idRole: RoleEnum.user,
        ).toMap(),
      );
      return const Right(true);
    } on DatabaseException catch (error) {
      return Left(error.result.toString());
    }
  }
}
