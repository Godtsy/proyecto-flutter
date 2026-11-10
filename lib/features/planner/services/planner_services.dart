import 'package:dio/dio.dart';
import 'package:mi_app_prueba/core/network/api_constants.dart';
import 'package:mi_app_prueba/core/network/dio_client.dart';
import 'package:mi_app_prueba/core/network/models/api_collection.dart';
import 'package:mi_app_prueba/features/planner/models/group_model.dart';

class PlannerServices {
  final Dio _dioClient;
  PlannerServices() : _dioClient = DioClient.buildClient();

  Future<ApiCollection<GroupModel>> getMyGroups() async {
    print('si entro');
    try {
      final Response apiResponse = await _dioClient.get(
        ApiConstants.getMyGroups,
      );
      print(apiResponse);
      return ApiCollection.fromJson(apiResponse.data, GroupModel.fromJson);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
