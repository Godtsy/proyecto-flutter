part of 'planner_bloc.dart';

sealed class PlannerState extends BaseState {}

final class PlannerInitial extends PlannerState {}

final class PlannerInProgres extends PlannerState {}

final class GroupsObtained extends PlannerState {
  final List<GroupModel> groups;
  GroupsObtained({required this.groups});
}

final class PlannerError extends PlannerState {
  final String error;
  PlannerError({required this.error});
}
