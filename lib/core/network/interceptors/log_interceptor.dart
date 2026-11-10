import 'dart:developer';

import 'package:dio/dio.dart';

final class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String url = options.uri.toString();
    final String method = options.method;
    final Map<String, dynamic> queryParams = options.queryParameters;
    final dynamic body = options.data;

    log('Request send to: $url');
    log('Method: $method');
    log('Query Params: $queryParams');
    log('Body: $body');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final int? status = response.statusCode;
    final dynamic responseData = response.data;

    log('Request Status: $status');
    log('Response: $responseData');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final String url = err.requestOptions.uri.toString();
    final String exceptionType = err.type.name;
    final int? status = err.response?.statusCode;
    final dynamic data = err.response?.data;

    log('Request error: $url');
    log('Exception type: $exceptionType');
    log('Status code: $status');
    log('Response: $data');

    super.onError(err, handler);
  }
}
