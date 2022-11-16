import 'package:pr2/domain/entity/role_entity.dart';

class UserEntity {
  late int id;
  final String login;
  final String password;
  final RoleEnum idRole;

  UserEntity(this.login, this.password, this.idRole);
}
