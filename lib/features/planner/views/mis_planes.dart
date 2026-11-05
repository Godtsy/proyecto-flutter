import 'package:flutter/material.dart';

import '../widgets/plan_card.dart';

class MisPlanesView extends StatelessWidget {
  const MisPlanesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 12),

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
              "Nuevo plan",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              children: const [
                PlanCard(planName: "Nombre del plan"),
                SizedBox(height: 12),
                PlanCard(planName: "Nombre del plan"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
