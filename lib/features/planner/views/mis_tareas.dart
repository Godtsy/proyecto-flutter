import 'package:flutter/material.dart';

class MisTareasView extends StatelessWidget {
  const MisTareasView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Vista de Mis Tareas (Figma 2)',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2B71F3),
        ),
      ),
    );
  }
}
