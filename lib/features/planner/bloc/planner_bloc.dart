import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_app_prueba/core/network/bloc/base_bloc.dart';
import 'package:mi_app_prueba/core/network/models/api_collection.dart';
import 'package:mi_app_prueba/features/planner/models/group_model.dart';
import 'package:mi_app_prueba/features/planner/services/planner_services.dart';

part 'planner_event.dart';
part 'planner_state.dart';

class PlannerBloc extends BaseBloc<PlannerEvent, BaseState> {
  PlannerBloc() : super(PlannerInitial()) {
    on<MyGroupRequested>(getMyGroups);
  }

  final PlannerServices _plannerServices = PlannerServices();

  Future<void> getMyGroups(
    MyGroupRequested event,
    Emitter<BaseState> emit,
  ) async {
    //emit(PlannerInProgres());
    try {
      final ApiCollection<GroupModel> responseApi = await _plannerServices
          .getMyGroups();
      emit(GroupsObtained(groups: responseApi.data));
    } on DioException catch (exception) {
      handleNetworkError(exception, emit);
    } catch (error) {
      emit(PlannerError(error: error.toString()));
    }
  }
}
