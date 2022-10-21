import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/core/crypto/crypto.dart';
import 'package:pr2/core/db/data_base_helper.dart';
import 'package:pr2/core/exception/failure.dart';
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
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try {
      var user = await _db.query(
        table,
        columns: ['login', 'password', 'id_role'],
        where: 'login = ?',
        whereArgs: [login],
      );

      if (user.isEmpty) {
        return Left('Такого пользователя нет');
      }

      if (user.first['password'] != Crypto.crypto(password)) {
        return Left(AuthPasswordFailure().errorMessage);
      }

      return Right(RoleEnum.values[(user.first['id_role'] as int) - 1]);
      // return Right(RoleEnum.values.firstWhere(
      //     (element) => element.id == (user.first['id_role'] as int)));
    } on DatabaseException catch (error) {
      return Left(FailureDB(error.getResultCode()!).error.errorMessage);
    }
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password) async {
    try {
      // var passHes = Crypto.crypto(password);
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
      return Left(FailureDB(error.getResultCode()!).error.errorMessage);
    }
  }
}
