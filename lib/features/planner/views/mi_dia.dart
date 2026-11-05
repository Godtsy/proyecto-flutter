import 'package:flutter/material.dart';

import '../widgets/task_card.dart'; // Importamos el widget reutilizable task_card

class MiDiaView extends StatelessWidget {
  const MiDiaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 12),

          // Botón "Nueva tarea" alineado a la derecha como en Figma
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

          // Lista de tarjetas de tareas consumiendo el componente TaskCard
          Expanded(
            child: ListView(
              children: const [
                TaskCard(
                  taskName: "Nombre de la tarea",
                  teamName: "Nombre del equipo",
                  date: "Fecha de hoy",
                  status: "Pendiente",
                  statusColor: Color(0xFFFFE58F),
                  textColor: Color(0xFFD48806),
                ),
                SizedBox(height: 12),
                TaskCard(
                  taskName: "Nombre de la tarea",
                  teamName: "Nombre del equipo",
                  date: "Fecha de hoy",
                  status: "Pendiente",
                  statusColor: Color(0xFFFFE58F),
                  textColor: Color(0xFFD48806),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
