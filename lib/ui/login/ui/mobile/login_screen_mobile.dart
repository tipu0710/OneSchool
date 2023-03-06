import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_school/ui/login/provider/login_ui_controller_provider.dart';
import 'package:one_school/ui/login/ui/widgets/login_background.dart';
import 'package:one_school/ui/login/ui/widgets/login_button.dart';
import 'package:one_school/ui/login/ui/widgets/login_email_field.dart';
import 'package:one_school/ui/login/ui/widgets/login_forgot_pass.dart';
import 'package:one_school/ui/login/ui/widgets/login_logo.dart';
import 'package:one_school/ui/login/ui/widgets/login_password_field.dart';
import 'package:one_school/ui/login/ui/widgets/login_signup_text.dart';
import 'package:one_school/ui/login/ui/widgets/login_text.dart';

class LoginScreenMobile extends ConsumerStatefulWidget {
  const LoginScreenMobile({super.key});

  @override
  ConsumerState<LoginScreenMobile> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreenMobile> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(loginUiControllerProvider);
    return Stack(
      children: [
        const Center(
          child: LoginBackground(),
        ),
        Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const LoginLogo(),
              const LoginText(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                  bottom: 10,
                  top: 20,
                ),
                child: LoginEmailField(
                    emailController: controller.emailController),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: LoginPasswordField(
                  passVisible: controller.passVisible,
                  passwordController: controller.passwordController,
                ),
              ),
              const SizedBox(height: 30),
              LoginButton(
                buttonController: controller.buttonController,
                formKey: controller.formKey,
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              const SizedBox(height: 15),
              const LoginForgotPass(),
              const Spacer(flex: 2),
              const LoginSignUpText(),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
