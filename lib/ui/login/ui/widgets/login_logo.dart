import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/svg/boost.svg")
            .animate()
            .fade(duration: 500.ms, curve: Curves.easeInOut);
  }
}