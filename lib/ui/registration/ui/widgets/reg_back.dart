import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class RegBack extends StatelessWidget {
  const RegBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/svg/reg_back.svg")
        .animate(
          onPlay: (controller) {
            controller.repeat(reverse: true);
          },
          autoPlay: true,
        )
        .moveY(duration: 3.seconds, curve: Curves.easeInOut);
  }
}
