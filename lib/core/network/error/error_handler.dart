import 'package:dio/dio.dart';

import 'failure.dart';

enum AuthErrorTypes { defaultError, incorrectPassword, unverified, blocked }

class AuthError implements Exception {
  AuthErrorTypes type;
  AuthError(this.type);
}

class ErrorHandler implements Exception {
  static Failure handleError(dynamic error) {
    if (error is Failure) {
      return error;
    } else if (error is AuthError) {
      return error.type.getFailure();
    } else if (error is DioException) {
      return _handleDioError(error);
    } else {
      return DefaultFailure();
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return TimeoutFailure();

      case DioExceptionType.receiveTimeout:
        return TimeoutFailure();

      case DioExceptionType.sendTimeout:
        return TimeoutFailure();
      case DioExceptionType.connectionError:
        return ConnectionFailure();

      case DioExceptionType.cancel:
        return CancelFailure();

      case DioExceptionType.badResponse:
        return error.response?.statusCode == 401
            ? AuthFailure()
            : error.response?.data is Map?
                ? Failure(
                    error.response?.data['code'],
                    error.response?.data['message'] is List
                        ? (error.response?.data['message'] as List).join(', ')
                        : error.response?.data['message'],
                  )
                : DefaultFailure();

      default:
        return DefaultFailure();
    }
  }
}

extension GetAuthFailure on AuthErrorTypes {
  Failure getFailure() {
    switch (this) {
      case AuthErrorTypes.incorrectPassword:
        return Failure(1, 'incorrectPassword');
      case AuthErrorTypes.unverified:
        return Failure(2, null);
      case AuthErrorTypes.blocked:
        return Failure(3, null);
      case AuthErrorTypes.defaultError:
        return Failure(0, null);
    }
  }
}
