import 'package:dio/dio.dart';

import '../config/constants.dart';
import 'interceptors/custom_interceptor.dart';
import 'interceptors/mock_interceptor.dart';

class NetworkClient {
  static Dio getDio(
      CustomInterceptor customInterceptor, MockInterceptor mockInterceptor) {
    final dio = Dio();

    dio.options
      ..baseUrl = AppConstants.baseUrl
      ..connectTimeout = const Duration(milliseconds: 10000)
      ..receiveTimeout = const Duration(milliseconds: 30000);

    dio.interceptors.add(customInterceptor);
    dio.interceptors.add(mockInterceptor);

    return dio;
  }
}
