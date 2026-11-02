import 'package:flutter/material.dart';

class MisPlanesView extends StatelessWidget {
  const MisPlanesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Vista de Mis Planes (Figma 3)',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2B71F3),
        ),
      ),
    );
  }
}
