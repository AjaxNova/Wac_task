import 'package:flutter/material.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({super.key, required this.staticText});

  final String staticText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text(staticText))],
    );
  }
}
