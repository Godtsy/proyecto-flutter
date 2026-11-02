import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/bottombar.dart';
import '../widgets/custom_selector.dart'; // Tu selector superior
import 'mi_dia.dart';
import 'mis_planes.dart';
import 'mis_tareas.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  // Índice exclusivo para las 3 sub-vistas de Planner (0: Mi día, 1: Mis tareas, 2: Mis planes)
  int _currentSubViewIndex = 0;

  // Las vistas que sí te corresponden maquetar según el diseño de Figma
  final List<Widget> _plannerSubViews = const [
    MiDiaView(),
    MisTareasView(),
    MisPlanesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),

      body: Column(
        children: [
          // 1. Selector superior para alternar entre Mi día, Mis tareas y Mis planes
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: CustomSelector(
              selectedIndex: _currentSubViewIndex,
              onTabSelected: (index) {
                setState(() {
                  _currentSubViewIndex = index;
                });
              },
            ),
          ),

          // 2. Contenido dinámico de la sub-vista seleccionada
          Expanded(child: _plannerSubViews[_currentSubViewIndex]),
        ],
      ),

      // 3. Footer estático (indicando que estamos en Planner, sin alterar el flujo)
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
