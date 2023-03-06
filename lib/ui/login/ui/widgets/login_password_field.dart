import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
    required this.passVisible,
    required this.passwordController,
  });

  final ValueNotifier<bool> passVisible;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: const Color.fromARGB(49, 130, 130, 130),
      elevation: 15,
      borderRadius: BorderRadius.circular(8),
      child: ValueListenableBuilder<bool>(
        valueListenable: passVisible,
        builder: (context, value, child) => TextFormField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter password";
            } else {
              return null;
            }
          },
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 18, 18, 18),
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.password),
            label: const Text("Password"),
            suffixIcon: IconButton(
              onPressed: () => passVisible.value = !value,
              icon: value
                  ? const Icon(CupertinoIcons.eye)
                  : const Icon(CupertinoIcons.eye_slash),
            ),
          ),
        ),
      ),
    ).animate().fade(delay: 1400.ms, curve: Curves.easeInOut);
  }
}
