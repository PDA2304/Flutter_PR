abstract class DataBaseRequest {
  /// Таблица Роли
  ///
  /// Поля таблицы: Название роли
  static const String tableRole = 'Role';

  /// Таблица Пользователи
  ///
  /// Поля таблицы: Логин, Пароль, Роль
  static const String tableUsers = 'Users';

  static const List<String> tableList = [
    tableRole,
    tableUsers,
  ];

  static const List<String> createTableList = [
    _createTableRole,
    _createTableUsers,
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole = '''CREATE TABLE "$tableRole" (
        "id_role" INTEGER,
        "role" TEXT NOT NULL UNIQUE,
        PRIMARY KEY("id_role" AUTOINCREMENT)
      )''';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers = '''CREATE TABLE "$tableUsers" (
        "id_user"	INTEGER,
        "login"	TEXT NOT NULL UNIQUE,
        "password"	TEXT NOT NULL,
        "role_id"	INTEGER,
        FOREIGN KEY("role_id") REFERENCES "Role"("id_role") ON DELETE CASCADE,
        PRIMARY KEY("id_user" AUTOINCREMENT) 
      )''';

  static String deleteTable(String table) => 'DROP TABLE $table';
}
