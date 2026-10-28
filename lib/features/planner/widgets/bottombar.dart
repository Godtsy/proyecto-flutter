import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      color: Colors.transparent,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFF2B71F3),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.grid_view_rounded, color: Colors.white),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStaticNavItem(
                      icon: Icons.checklist_rounded,
                      label: "Planner",
                      color: const Color(0xFF2B71F3),
                      isBold: true,
                    ),

                    _buildStaticNavItem(
                      icon: Icons.inventory_2_outlined,
                      label: "Importaciones",
                      color: Colors.grey.shade400,
                      isBold: false,
                    ),

                    // Elemento 3: Ventas
                    _buildStaticNavItem(
                      icon: Icons.local_offer_outlined,
                      label: "Ventas",
                      color: Colors.grey.shade400,
                      isBold: false,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 8),

            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF2B71F3).withValues(alpha: 0.4),
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.smart_toy_outlined,
                color: Color(0xFF2B71F3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticNavItem({
    required IconData icon,
    required String label,
    required Color color,
    required bool isBold,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
