import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_app_prueba/core/navigation/app_routes.dart';
import 'package:mi_app_prueba/features/planner/bloc/planner_bloc.dart';
import 'package:mi_app_prueba/features/planner/views/planner_screen.dart';

class LandingRoutes {
  static Route<dynamic> generateRotes(RouteSettings settings) {
    final Object? arguments = settings.arguments;
    switch (settings.name) {
      case AppRoutes.planner:
        return MaterialPageRoute<PlannerScreen>(
          builder: (BuildContext context) => BlocProvider<PlannerBloc>(
            create: (BuildContext context) => PlannerBloc(),
            child: PlannerScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
