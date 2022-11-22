import 'dart:developer';

import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/entity/user_entity.dart';

class User extends UserEntity {
  User({
    required super.login,
    required super.password,
    required super.idRole,
  });

  Map<String, dynamic> toMap() {
    return {'login': login, 'password': password};
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      password: json['password'],
      idRole: RoleEnum.values.firstWhere(
        (element) => element.id == (json['id_role'] as int),
      ),
    );
  }
}
