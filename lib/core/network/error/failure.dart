class Failure {
  final int? responseCode;
  final String? message;

  Failure(this.responseCode, this.message);

  @override
  String toString() {
    return message ?? 'An error occurred';
  }
}

class TimeoutFailure extends Failure {
  TimeoutFailure()
      : super(null, "Request timed out, check your internet connection");
}

class ConnectionFailure extends Failure {
  ConnectionFailure() : super(null, "no internet connection");
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(0, 'An unknown error occurred');
}

class CancelFailure extends Failure {
  CancelFailure() : super(0, 'Request was canceled');
}

class AuthFailure extends Failure {
  AuthFailure() : super(401, 'Authentication failed');
}

class NoInternetFailure extends Failure {
  NoInternetFailure() : super(-1, 'No internet connection');
}
