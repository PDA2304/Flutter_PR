import 'package:flutter_application_1/domain/entity/role_enitty.dart';

class Role extends RoleEntity {
  Role({required super.role});

  Map<String, dynamic> toMap() {
    return {
      'role': role,
    };
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(role: json['role']);
  }
}
