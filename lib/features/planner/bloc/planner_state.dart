part of 'planner_bloc.dart';

sealed class PlannerState extends BaseState {}

final class PlannerInitial extends PlannerState {}

final class PlannerInProgres extends PlannerState {}

/*
final class GroupsObtained extends PlannerState {
  final List<GroupModel> groups;
  GroupsObtained({required this.groups});
}
*/
final class GroupsObtained extends PlannerState {
  final List<GroupModel> groups;
  GroupsObtained({required this.groups});

  @override
  List<Object> get props => [groups]; // <-- lo que lo hace distinto
}

/*
final class PlannerError extends PlannerState {
  final String error;
  PlannerError({required this.error});
}
*/

final class PlannerError extends PlannerState {
  final String error;
  PlannerError({required this.error});

  @override
  List<Object> get props => [error]; // <-- lo que lo hace distinto
}
