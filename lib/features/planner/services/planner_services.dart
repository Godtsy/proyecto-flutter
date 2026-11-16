import 'package:dio/dio.dart';
import 'package:mi_app_prueba/core/network/api_constants.dart';
import 'package:mi_app_prueba/core/network/dio_client.dart';
import 'package:mi_app_prueba/core/network/models/api_collection.dart';
import 'package:mi_app_prueba/features/planner/models/group_model.dart';
import 'package:mi_app_prueba/features/planner/models/id_plan_group_model.dart';

class PlannerServices {
  final Dio _dioClient;
  PlannerServices() : _dioClient = DioClient.buildClient();

  Future<ApiCollection<GroupModel>> getMyGroups() async {
    print('getMyGroups entro');
    try {
      final Response apiResponse = await _dioClient.get(
        ApiConstants.getMyGroups,
      );
      print('getMyGroups respuesta: $apiResponse');
      return ApiCollection.fromJson(apiResponse.data, GroupModel.fromJson);
    } catch (error) {
      print('getMyGroups error: $error');
      rethrow;
    }
  }

  Future<ApiCollection<IdPlanGroupModel>> getPlansByGroupId(
    String groupId,
  ) async {
    print('getPlansByGroupId entro (groupId: $groupId)');
    try {
      final Response apiResponse = await _dioClient.get(
        '${ApiConstants.getPlansByGroupId}/$groupId',
      );
      print('getPlansByGroupId respuesta: $apiResponse');
      return ApiCollection.fromJson(
        apiResponse.data,
        IdPlanGroupModel.fromJson,
      );
    } catch (error) {
      print('getPlansByGroupId error: $error');
      rethrow;
    }
  }
}
