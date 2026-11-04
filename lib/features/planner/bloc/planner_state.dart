part of 'planner_bloc.dart';

sealed class PlannerState extends Equatable {
  const PlannerState();
  
  @override
  List<Object> get props => [];
}

final class PlannerInitial extends PlannerState {}
