import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_school/ui/registration/provider/registration_provider.dart';

class RegPhoneField extends ConsumerWidget {
  const RegPhoneField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(
        registrationUiHolderProvider.select((value) => value.phoneNumber));
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: const Color.fromARGB(49, 130, 130, 130),
      elevation: 15,
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter phone number";
          } else {
            return null;
          }
        },
        style: const TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 18, 18, 18),
          fontWeight: FontWeight.w400,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(CupertinoIcons.phone_fill),
          label: Text("Phone"),
        ),
      ),
    ).animate().fade(delay: 1100.ms, curve: Curves.easeInOut);
  }
}
