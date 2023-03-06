import 'package:flutter/material.dart';
import 'package:one_school/ui/uiHelper/animatedButton/button_controller.dart';

// ignore: constant_identifier_names
enum Role { Teacher, Parent }

mixin RegistrationUiAbs {
  abstract ValueNotifier<bool> passwordObsecure;
  abstract ValueNotifier<bool> rePasswordObsecure;
  abstract TextEditingController roleController;
  abstract TextEditingController nameController;
  abstract TextEditingController phoneNumber;
  abstract TextEditingController userId;
  abstract TextEditingController password;
  abstract TextEditingController confirmPassword;
  abstract ButtonController registerButtonController;
  abstract GlobalKey<FormState> formKey;
}
