import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:one_school/core/utils.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: const Color.fromARGB(49, 130, 130, 130),
      elevation: 15,
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        controller: emailController,
        validator: Utils.emailValidate,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 18, 18, 18),
          fontWeight: FontWeight.w400,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email),
          label: Text("Email"),
        ),
      ),
    ).animate().fade(delay: 1200.ms, curve: Curves.easeInOut);
  }
}
