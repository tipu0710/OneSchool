import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_school/core/global.dart';

class LoginSignUpText extends StatelessWidget {
  const LoginSignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go(registration);
      },
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(color: Color.fromARGB(255, 55, 55, 55)),
          children: [
            TextSpan(
              text: "Register",
              style: GoogleFonts.merienda(
                textStyle: const TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    ).animate().fade(delay: 1700.ms, curve: Curves.easeInOut);
  }
}
