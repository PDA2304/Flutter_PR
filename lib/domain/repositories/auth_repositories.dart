import 'package:dartz/dartz.dart';
import 'package:pr2/domain/entity/role_entity.dart';

abstract class AuthRepositories {
  String get table;

  /// Метод для авторизации пользователя
  Future<Either<String, RoleEnum>> signIn(String login, String password);

  /// Метод для регистрации пользователя
  Future<Either<String, bool>> signUp(String login, String password);
}
