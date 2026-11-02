import 'package:flutter/material.dart';

class CustomSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const CustomSelector({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem(index: 0, title: "Mi día"),
          _buildTabItem(index: 1, title: "Mis tareas"),
          _buildTabItem(index: 2, title: "Mis planes"),
        ],
      ),
    );
  }

  Widget _buildTabItem({required int index, required String title}) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color.from(
                        alpha: 1,
                        red: 0,
                        green: 0,
                        blue: 0,
                      ).withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF2B71F3)
                  : Colors.grey.shade600,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
