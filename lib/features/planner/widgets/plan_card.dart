import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String planName;

  const PlanCard({super.key, required this.planName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            planName,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(
                0xFF2B71F3,
              ), // Azul característico de los títulos de plan
            ),
          ),

          SizedBox(
            width: 80,
            height: 32,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: _buildAvatar(Colors.teal.shade300, Icons.person),
                ),
                Positioned(
                  left: 20,
                  child: _buildAvatar(Colors.pink.shade300, Icons.person),
                ),
                Positioned(
                  left: 40,
                  child: _buildAvatar(Colors.indigo.shade300, Icons.person),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(Color backgroundColor, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: CircleAvatar(
        radius: 14,
        backgroundColor: backgroundColor,
        child: Icon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}
