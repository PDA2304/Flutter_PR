import 'package:pr1/domain/entity/role_entity.dart';
import 'package:pr1/domain/entity/user_entity.dart';

class User extends UserEntity {
  final String password;

  User({
    required super.login,
    required this.password,
    required super.idRole,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
      'id_role': idRole.id,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      password: json['password'],
      idRole: RoleEnum.values
          .firstWhere((element) => element.id == json['id_role']),
    );
  }
}
