part of 'planner_bloc.dart';

sealed class PlannerEvent extends Equatable {
  const PlannerEvent();

  @override
  List<Object> get props => [];
}

final class MyGroupRequested extends PlannerEvent {}
