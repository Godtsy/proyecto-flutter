import 'package:flutter/material.dart';
import 'package:mi_app_prueba/core/navigation/app_routes.dart';
import 'package:mi_app_prueba/core/navigation/landing_routes.dart';

void main() {
  runApp(MiAppPrueba());
}

class MiAppPrueba extends StatelessWidget {
  MiAppPrueba({super.key});
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.planner,
      onGenerateRoute: LandingRoutes.generateRotes,
    );
  }
}
