
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:one_school/core/global.dart';

class LoginForgotPass extends StatelessWidget {
  const LoginForgotPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Forgot password?",
      style: TextStyle(color: primaryColor, fontSize: 12),
    ).animate().fade(delay: 1650.ms, curve: Curves.easeInOut);
  }
}