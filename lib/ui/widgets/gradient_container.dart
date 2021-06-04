import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.6, 0.8, 1.0],
          colors: [
            color.shade700,
            color.shade500,
            color.shade300,
          ],
        ),
      ),
      child: child,
    );
  }
}
