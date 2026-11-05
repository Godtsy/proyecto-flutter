import 'package:flutter/material.dart';

import '../widgets/task_status_group.dart';

class MisTareasView extends StatelessWidget {
  const MisTareasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 12),

          // Botón superior "Nueva tarea" alineado a la derecha
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2B71F3),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            icon: const Icon(Icons.add, size: 18),
            label: const Text(
              "Nueva tarea",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(height: 16),

          // Lista de secciones (Pendientes, En curso, Completadas)
          Expanded(
            child: ListView(
              children: [
                // --- BLOQUE 1: PENDIENTES ---
                _buildSectionContainer(
                  title: "Pendientes",
                  children: const [
                    TaskStatusGroup(
                      taskName: "Nombre de la tarea",
                      teamName: "Nombre del equipo",
                      date: "Fecha de entrega",
                    ),
                    SizedBox(height: 12),
                    TaskStatusGroup(
                      taskName: "Nombre de la tarea",
                      teamName: "Nombre del equipo",
                      date: "Fecha de entrega",
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // --- BLOQUE 2: EN CURSO ---
                _buildSectionContainer(
                  title: "En curso",
                  children: const [
                    TaskStatusGroup(
                      taskName: "Nombre de la tarea",
                      teamName: "Nombre del equipo",
                      date: "Fecha de entrega",
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // --- BLOQUE 3: COMPLETADAS ---
                _buildSectionContainer(
                  title: "Completadas",
                  children: const [
                    TaskStatusGroup(
                      taskName: "Nombre de la tarea",
                      teamName: "Nombre del equipo",
                      date: "Fecha de entrega",
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Contenedor visual blanco que agrupa cada bloque de estado
  Widget _buildSectionContainer({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B71F3),
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}
