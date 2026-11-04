import 'package:dio/dio.dart';
import 'package:mi_app_prueba/core/network/api_constants.dart';
import 'package:mi_app_prueba/core/network/dio_client.dart';

class PlannerServices {
  final Dio _dioClient;
  PlannerServices() : _dioClient = DioClient.buildClient();

  Future<void> getMyGroups() async {
    final Response apiResponse = await _dioClient.get(ApiConstants.getMyGroups);
    print(apiResponse);
  }
}
