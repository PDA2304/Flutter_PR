import 'dart:developer';

import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/entity/user_entity.dart';

class User extends UserEntity {
  User(
    super.login,
    super.password,
    super.idRole,
  );

  Map<String, dynamic> toMap() {
    return {'login': login, 'password': password};
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      json['login'],
      json['password'],
      RoleEnum.values.firstWhere(
        (element) => element.id == (json['id_role'] as int),
      ),
    );
  }
}
