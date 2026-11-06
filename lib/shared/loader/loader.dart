import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black45,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
