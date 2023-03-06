import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:one_school/ui/uiHelper/animatedButton/button_controller.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.buttonController,
    this.margin,
    this.size,
    this.loadingWidget,
    this.elevation = 8,
    this.shape,
  });

  final VoidCallback onPressed;
  final Widget child;
  final ButtonController? buttonController;
  final EdgeInsetsGeometry? margin;
  final Size? size;
  final Widget? loadingWidget;

  /// Default value is 8
  final double elevation;

  /// Default value
  /// ```dart
  /// RoundedRectangleBorder(
  ///   borderRadius: BorderRadius.circular(10.0),
  /// )
  /// ```
  final OutlinedBorder? shape;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    widget.buttonController?.addListener(() {
      if (mounted) {
        setState(() {
          _animate =
              widget.buttonController!.state == AnimatedButtonState.running;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    //buttonChild = widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    //widget.buttonController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _animate ? () {} : widget.onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: widget.size,
        elevation: widget.elevation,
        shape: widget.shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
      ),
      child: Stack(
        children: [
          Center(child: widget.child).animate(target: _animate ? 0 : 1).fadeIn(
                duration: 500.ms,
                curve: Curves.easeInOut,
              ),
          Center(
            child: SizedBox(
              height: 35,
              width: 35,
              child: widget.loadingWidget ??
                  const CircularProgressIndicator.adaptive(),
            ),
          ).animate(target: _animate ? 0 : 1).fadeOut(
                delay: 500.ms,
                duration: 500.ms,
                curve: Curves.easeInOut,
              ),
        ],
      ),
    ).animate(target: _animate ? 1 : 0).shimmer(
          curve: Curves.easeInOut,
          duration: 500.ms,
        );
  }
}
