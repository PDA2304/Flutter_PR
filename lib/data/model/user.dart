import 'package:pr2/domain/entity/user_entity.dart';

class User extends UserEntity {
  User({
    super.id = 0,
    required super.login,
    required super.password,
    required super.idRole,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
      'id_role': idRole.id,
    };
  }
}
