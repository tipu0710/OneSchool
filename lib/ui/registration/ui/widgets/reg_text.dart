import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RegText extends StatelessWidget {
  const RegText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Fill up all the fields",
      style: TextStyle(
        color: Color.fromARGB(255, 27, 27, 27),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).animate().fade(delay: 1.seconds);
  }
}
