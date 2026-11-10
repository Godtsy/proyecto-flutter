import 'package:dio/dio.dart';
import 'package:mi_app_prueba/core/network/api_constants.dart';
import 'package:mi_app_prueba/core/network/interceptors/headers.dart';
import 'package:mi_app_prueba/core/network/interceptors/log_interceptor.dart';

class DioClient {
  static Dio buildClient() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        validateStatus: (status) => status! <= 201,
        sendTimeout: Duration(seconds: 10),
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );
    dio.interceptors
      ..add(HeadersInterceptors())
      ..add(AppInterceptor());
    return dio;
  }
}
