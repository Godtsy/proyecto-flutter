import 'package:flutter/material.dart';

import 'features/planner/views/planner_screen.dart';

void main() {
  runApp(const MiAppPrueba());
}

class MiAppPrueba extends StatelessWidget {
  const MiAppPrueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlannerScreen(),
    );
  }
}
