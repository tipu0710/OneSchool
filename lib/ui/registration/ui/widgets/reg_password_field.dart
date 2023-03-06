import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_school/ui/registration/provider/registration_provider.dart';

class RegPasswordField extends ConsumerWidget {
  const RegPasswordField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var passObsecureNotifier = ref.watch(
        registrationUiHolderProvider.select((value) => value.passwordObsecure));
    var passwordController = ref
        .watch(registrationUiHolderProvider.select((value) => value.password));
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: const Color.fromARGB(49, 130, 130, 130),
      elevation: 15,
      borderRadius: BorderRadius.circular(8),
      child: ValueListenableBuilder<bool>(
        valueListenable: passObsecureNotifier,
        builder: (context, value, child) => TextFormField(
          controller: passwordController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          obscureText: value,
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
              onPressed: () => passObsecureNotifier.value = !value,
              icon: !value
                  ? const Icon(CupertinoIcons.eye)
                  : const Icon(CupertinoIcons.eye_slash),
            ),
          ),
        ),
      ),
    ).animate().fade(delay: 1300.ms, curve: Curves.easeInOut);
  }
}
