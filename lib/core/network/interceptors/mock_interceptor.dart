import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/json/';
  static const _jsonExtension = '.json';

  @override
  Future onRequest(RequestOptions options, handler) async {
    var newDirectory = _jsonDir;
    var resourcePath = newDirectory + options.path;

    if (options.data is! FormData) {
      if (options.queryParameters['id'] != null) {
        resourcePath = '$resourcePath-${options.queryParameters['id']}';
      }
    }

    resourcePath = resourcePath + _jsonExtension;
    dynamic responseData;
    Response response;
    try {
      final data = await rootBundle.load(resourcePath);

      responseData = json.decode(
        utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        ),
      );
      response = Response(
        data: responseData,
        statusCode: 200,
        requestOptions: options,
      );

      return handler.resolve(response);
    } catch (e) {
      if (kDebugMode) {
        debugPrint('MockError---->$e');
      }
      // response = Response(
      //   data: responseData,
      //   statusCode: 404,
      //   requestOptions: options,
      // );
      // return handler
      //     .reject(DioError(requestOptions: options, response: response));
      return handler.next(options);
    }
  }
}
