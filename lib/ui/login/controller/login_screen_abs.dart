import 'package:flutter/material.dart';
import 'package:one_school/ui/uiHelper/animatedButton/button_controller.dart';

mixin LoginScreenAbs {
  abstract TextEditingController emailController;
  abstract TextEditingController passwordController;
  abstract ValueNotifier<bool> passVisible;
  abstract ButtonController buttonController;
  abstract GlobalKey<FormState> formKey;
}
