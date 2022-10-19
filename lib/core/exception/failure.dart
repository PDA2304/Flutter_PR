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
          return AuthPasswordFailure();
        }
      default:
        return AuthPasswordFailure();
    }
  }
}

class AuthPasswordFailure implements Failure {
  @override
  int code = 1054;

  @override
  String errorMessage = 'Неправильный пароль';
}
