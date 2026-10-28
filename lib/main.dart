import 'package:flutter/material.dart';

import 'features/planner/widgets/appbar.dart';
import 'features/planner/widgets/bottombar.dart';

void main() {
  runApp(const MiAppPrueba());
}

class MiAppPrueba extends StatelessWidget {
  const MiAppPrueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: const Center(child: Text('Hola, ya funciona')),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}
