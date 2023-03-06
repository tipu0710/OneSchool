import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_school/service/hive/hivedata.dart';
import 'package:one_school/ui/login/model/login_model.dart';
import 'package:one_school/ui/uiHelper/animatedButton/animated_button.dart';
import 'package:one_school/ui/uiHelper/animatedButton/button_controller.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.buttonController,
    required this.formKey,
    this.padding,
  });

  final ButtonController buttonController;
  final GlobalKey<FormState> formKey;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: AnimatedButton(
        buttonController: buttonController,
        size: const Size(450, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () async {
          if (formKey.currentState?.validate() == true) {
            buttonController.start();
            await Future.delayed(4.seconds);
            buttonController.stop();
            HiveData.data.setLoginModel(
              const LoginModel(username: "username", password: "password"),
              ref,
            );
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 15),
        ),
      ).animate().fade(
            delay: 1600.ms,
            curve: Curves.easeInOut,
          ),
    );
  }
}
