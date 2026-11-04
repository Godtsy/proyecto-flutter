import 'package:dio/dio.dart';
import 'package:mi_app_prueba/core/network/api_constants.dart';
import 'package:mi_app_prueba/core/network/interceptors/headers.dart';

class DioClient {
  static Dio buildClient() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        validateStatus: (status) => status! <= 201,
      ),
    );
    dio.interceptors.add(HeadersInterceptors());
    return dio;
  }
}
