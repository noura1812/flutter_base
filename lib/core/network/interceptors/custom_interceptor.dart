import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

import '../../common/domain/repository/preferences_repository.dart';
import '../../config/constants.dart';

@injectable
class CustomInterceptor extends Interceptor {
  final PreferencesRepository preferencesRepository;

  CustomInterceptor(this.preferencesRepository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> headers = options.headers;

    debugPrint("Request URL: ${options.uri}");

    final businessId =
        preferencesRepository.getValueByKey(AppConstants.businessIdKey);

    if (options.data is FormData) {
      final Map<String, dynamic> bodyMap = {};
      bodyMap.addEntries(options.data.fields);

      if (businessId != null) bodyMap['business_id'] = '$businessId';
      options.data = FormData.fromMap(bodyMap);
      debugPrint("FormData =>  RequestBody: ${jsonEncode(bodyMap)}");
    } else if (options.data is Map<String, dynamic>) {
      final body = options.data as Map<String, dynamic>;
      if (businessId != null) {
        body['business_id'] = '$businessId';
      }
      options.data = body;
      debugPrint("RequestBody: ${jsonEncode(body)}");
    } else {
      if (businessId != null) {
        options.queryParameters['business_id'] = '$businessId';
      }
      debugPrint("Query Parameters: ${options.queryParameters}");
    }
    debugPrint(
        'Bearer ${preferencesRepository.getValueByKey(AppConstants.tokenKey)}');
    headers.addAll({
      'Authorization':
          'Bearer ${preferencesRepository.getValueByKey(AppConstants.tokenKey)}',
      'content-type': "application/json",
      'lang': '${preferencesRepository.getValueByKey(AppConstants.localeKey)}',
      'countryId':
          '${preferencesRepository.getValueByKey(AppConstants.countryKey)}',
    });
    options.headers = headers;

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("ResponseBody: ${response.data}");
    super.onResponse(response, handler);
  }
}
