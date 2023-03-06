import 'package:flutter/material.dart';
import 'package:one_school/ui/login/ui/mobile/login_screen_mobile.dart';
import 'package:one_school/ui/login/ui/tablet/login_screen_tablet.dart';
import 'package:one_school/ui/uiHelper/responsive/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ResponsiveScreen(
        mobile: LoginScreenMobile(),
        desktop: LoginScreenTablet(),
        tablet: LoginScreenTablet(),
      ),
    );
  }
}
