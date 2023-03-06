import 'package:flutter/material.dart';
import 'package:one_school/ui/registration/ui/mobile/registration_mobile.dart';
import 'package:one_school/ui/registration/ui/tablet/registration_tablet.dart';
import 'package:one_school/ui/uiHelper/responsive/responsive.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveScreen(
        mobile: RegistrationMobile(),
        tablet: RegistrationTablet(),
        desktop: RegistrationTablet(),
      ),
    );
  }
}
