import 'dart:developer';
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

class LoginScreenTablet extends ConsumerStatefulWidget {
  const LoginScreenTablet({super.key});

  @override
  ConsumerState<LoginScreenTablet> createState() => _LoginScreenTabletState();
}

class _LoginScreenTabletState extends ConsumerState<LoginScreenTablet> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(loginUiControllerProvider);
    log("message");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Form(
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
                        left: 20.0, right: 20, bottom: 10, top: 20),
                    child: SizedBox(
                      width: 450,
                      child: LoginEmailField(
                          emailController: controller.emailController),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 450,
                      child: LoginPasswordField(
                        passVisible: controller.passVisible,
                        passwordController: controller.passwordController,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  LoginButton(
                    buttonController: controller.buttonController,
                    formKey: controller.formKey,
                  ),
                  const SizedBox(height: 15),
                  const LoginForgotPass(),
                  const Spacer(flex: 2),
                  const LoginSignUpText(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
        const Flexible(
          child: LoginBackground(),
        ),
      ],
    );
  }
}
