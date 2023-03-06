import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_school/ui/login/ui/widgets/login_logo.dart';
import 'package:one_school/ui/registration/provider/registration_provider.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_back.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_button.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_full_name_field.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_password_field.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_phone_field.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_re_password_field.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_role.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_text.dart';
import 'package:one_school/ui/registration/ui/widgets/reg_user_id_field.dart';

class RegistrationMobile extends ConsumerStatefulWidget {
  const RegistrationMobile({super.key});

  @override
  ConsumerState<RegistrationMobile> createState() => _RegistrationMobileState();
}

class _RegistrationMobileState extends ConsumerState<RegistrationMobile> {
  @override
  Widget build(BuildContext context) {
    var formKey = ref
        .watch(registrationUiHolderProvider.select((value) => value.formKey));
    return Stack(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: RegBack(),
          ),
        ),
        SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  LoginLogo(),
                  RegText(),
                  SizedBox(height: 10),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: RegNameField(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: RegPhoneField(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: RegUserIdField(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: RegRoleField(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: RegPasswordField(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: RegRePasswordField(),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: RegistrationButton(),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
