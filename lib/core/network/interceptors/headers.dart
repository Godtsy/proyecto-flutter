import 'package:dio/dio.dart';

class HeadersInterceptors extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String urlTokend = '';
    options.headers['SecretKey'] = 'ujJTh2rta8ItSm/1PYQGxq2GQZXtFEq1yHYhtsIztUi66uaVbfNG7IwX9eoQ817jy8UUeX7X3dMUVGTioLq0Ew==';
    options.headers['AppVersion'] = 'kGEufq53XKtX5Ozs+ARsxOJtpvdC2Vo1EgAf4oAXOul1TZyDc3xAJ9pE9QXDe3KiuPmHdJ24crrIY6C2v0IKMg==';
    options.headers['AppBundle'] = 'com.nucodiga.tectrans';
    options.headers['OSClient'] = 'iOS';
    options.headers['Authorization'] = 'Bearer $urlTokend';
  }
}
