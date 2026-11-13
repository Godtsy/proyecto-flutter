part of 'planner_bloc.dart';

sealed class PlannerEvent extends Equatable {
  const PlannerEvent();

  @override
  List<Object> get props => [];
}

final class MyGroupRequested extends PlannerEvent {}

final class PlansByGroupRequested extends PlannerEvent {
  final String groupId;
  const PlansByGroupRequested({required this.groupId});

  @override
  List<Object> get props => [groupId];
}
