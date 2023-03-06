import 'package:flutter/material.dart';
import 'package:one_school/ui/login/controller/login_screen_abs.dart';
import 'package:one_school/ui/uiHelper/animatedButton/button_controller.dart';

class LoginUiController with LoginScreenAbs {
  @override
  ButtonController buttonController = ButtonController();

  @override
  TextEditingController emailController = TextEditingController();

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  ValueNotifier<bool> passVisible = ValueNotifier(false);

  @override
  TextEditingController passwordController = TextEditingController();
}
