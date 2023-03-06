import 'package:flutter/material.dart';
import 'package:one_school/ui/registration/controller/registration_ui_abs.dart';
import 'package:one_school/ui/uiHelper/animatedButton/button_controller.dart';

class RegistrationUiHolder with RegistrationUiAbs {
  @override
  TextEditingController confirmPassword = TextEditingController();

  @override
  TextEditingController nameController = TextEditingController();

  @override
  TextEditingController password = TextEditingController();

  @override
  TextEditingController phoneNumber = TextEditingController();

  @override
  ButtonController registerButtonController = ButtonController();

  @override
  TextEditingController userId = TextEditingController();

  @override
  TextEditingController roleController = TextEditingController();
  
  @override
  ValueNotifier<bool> passwordObsecure = ValueNotifier(true);
  
  @override
  ValueNotifier<bool> rePasswordObsecure = ValueNotifier(true);
  
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
