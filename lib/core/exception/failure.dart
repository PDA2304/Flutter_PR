abstract class Failure {
  String errorMessage = '';
  int code = 0;
}

class FailureDB extends Failure {
  final int getResultCode;

  FailureDB(this.getResultCode);

  Failure get error {
    switch (getResultCode) {
      case 1555:
        {
          return InsertFailure();
        }
        
      default:
        return DefaultFailure();
    }
  }
}

class DefaultFailure implements Failure {
  @override
  int code = 0;

  @override
  String errorMessage = 'Неизвестная ошибка';
}

class InsertFailure implements Failure {
  @override
  int code = 1555;

  @override
  String errorMessage = 'Такие данные уже есть в базе данных';
}

class AuthPasswordFailure implements Failure {
  @override
  int code = 1054;

  @override
  String errorMessage = 'Неправильный пароль';
}
